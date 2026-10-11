# Playbook 2 — Phát triển một tính năng trong dự án đã có

> **Developer chịu trách nhiệm hiểu hệ thống, quyết định cách thay đổi và kiểm tra kết quả.** Agent hỗ trợ đọc code, nghiên cứu, đề xuất, vẽ sơ đồ, implement và test trong phạm vi được giao. Đừng approve code mà bạn không giải thích được.
>
> **Khi nào dùng?** Khi dự án đã có code hoặc đã có kiến trúc nền và bạn muốn thêm chức năng, sửa hành vi, sửa bug hoặc refactor một phần. Nếu chưa có dự án, bắt đầu từ [Playbook 1 — Phát triển dự án từ con số 0](project-start-playbook.md).

## Cách sử dụng

- Làm theo **7 bước** dưới đây. Một thay đổi nhỏ có thể chỉ cần vài dòng trong Issue, không cần thêm tài liệu hay sơ đồ.
- **Không** vẽ lại toàn bộ Use Case, ERD hoặc kiến trúc dự án khi chúng không bị ảnh hưởng. Đọc thiết kế/code hiện tại trước khi đề xuất thay đổi.
- Câu hỏi chưa cần giải quyết có thể để mở; câu hỏi ảnh hưởng trực tiếp đến hành vi, quyền, dữ liệu hoặc an toàn thì phải làm rõ trước khi code.
- Khi yêu cầu thực chất là **thay công nghệ hoặc kiến trúc lớn**, mở rộng phân tích tại Bước 3–5 để xác định current/target design, migration, cutover, rollback và regression. Không âm thầm coi đó là một task code nhỏ.

## Bản đồ 7 bước

| Bước | Developer cần hiểu hoặc quyết định | Đầu ra tối thiểu |
| --- | --- | --- |
| 1. Hiểu hệ thống hiện tại | Tính năng nằm ở đâu, code đang làm gì? | Current behavior, files/contracts liên quan |
| 2. Xác định thay đổi | Ai cần gì, thế nào là đúng/sai? | Scope + Acceptance Criteria |
| 3. Phân tích tác động | Những gì sẽ bị ảnh hưởng hoặc hỏng? | Impact & risk notes |
| 4. Thiết kế vừa đủ | Sẽ thay đổi data, API, flow, state như thế nào? | Design nhỏ + diagram *nếu cần* |
| 5. Lập kế hoạch và kiểm tra sẵn sàng | Thay đổi theo thứ tự nào, test ra sao? | Plan, tests, Definition of Ready |
| 6. Implement và kiểm thử | Code có chạy đúng và không phá chức năng cũ? | Commits + test evidence |
| 7. Review và tích hợp | Có hiểu diff, rollback được, tài liệu còn đúng? | PR được review, cập nhật tri thức khi cần |

## 1. Hiểu hệ thống đang có — Current Behavior

**Developer làm gì:** Đọc Issue/yêu cầu, `PROJECT-OVERVIEW.md`, phần liên quan trong architecture/spec, rồi tìm entry point, logic, models, API và tests trong code hiện tại. Vẽ hoặc viết ngắn một đường đi của tính năng hiện có: input → module xử lý → dữ liệu → output. Kiểm tra thực tế thay vì chỉ đọc README.

**Agent hỗ trợ:** Tìm code path, chỉ ra dependencies và giải thích cách các module phối hợp; phân biệt điều code/test xác nhận với điều chỉ đang suy đoán.

**Tự kiểm tra:** Bạn trả lời được "tính năng này hiện chạy từ đâu đến đâu?", "ai sở hữu dữ liệu/quyền?", "có tests nào bảo vệ hành vi cũ?". Nếu thiếu câu trả lời quan trọng, chưa nên nhảy vào sửa code.

**Kết quả:** Mô tả ngắn current behavior và tài liệu/code liên quan (ưu tiên dẫn link, không sao chép toàn bộ kiến trúc).

*Ví dụ Knora:* Muốn thêm tính năng archive Conversation, trước tiên cần biết Conversation được lưu thế nào, ai được archive và archived conversation hiện được truy xuất ra sao.

## 2. Xác định chính xác thay đổi — Requirements & Acceptance

**Developer làm gì:** Nói rõ người dùng nào cần chức năng nào, hành vi trước/sau, ranh giới **làm / không làm**. Viết ít nhất một tình huống thành công và một tình huống lỗi hoặc trường hợp biên nếu có ý nghĩa. Chỉ định kết quả có thể nhìn thấy hoặc test được.

**Agent hỗ trợ:** Chuyển yêu cầu thành Given/When/Then, phát hiện case bị quên, kiểm tra xem acceptance mâu thuẫn với behavior cũ hay không. Agent không tự mở rộng scope.

**Tự kiểm tra:** Một người khác có thể dùng các tiêu chí này để nhận biết tính năng đã hoàn thành chưa, không cần đoán ý bạn không?

*Ví dụ:*
- Given Conversation thuộc Workspace A và đang active, When owner archive, Then Conversation được đánh dấu archived và không còn nằm trong danh sách active.
- Given user không có quyền trên Workspace A, When gọi archive API, Then request bị từ chối và dữ liệu không đổi.
- **Không làm:** Xóa vĩnh viễn, thay đổi mô hình authorization hoặc redesign toàn bộ sidebar.

**Kết quả:** Một GitHub Issue với mục tiêu, phạm vi và acceptance rõ; không cần spec file nếu Issue đủ để triển khai.

## 3. Phân tích tác động — Impact & Risk

**Developer làm gì:** Đi theo luồng hiện tại để xác định các phần phải sửa và phần phải giữ nguyên. Dùng các câu hỏi dưới đây **khi có liên quan**, không yêu cầu check hết cho mọi tính năng.

| Chạm vào… | Câu hỏi cần trả lời |
| --- | --- |
| API / UI | Có đổi input, output, trạng thái, error code hay tương thích client cũ? |
| Database / dữ liệu | Thêm field/table/migration? Dữ liệu cũ xử lý ra sao? |
| Authorization | Ai có quyền, có lộ dữ liệu hoặc cross-tenant access không? |
| Async jobs / state | Có race condition, retry, idempotency, lỗi giữa chừng không? |
| External service | Timeout, rate limit, unavailable, chi phí hoặc fallback ra sao? |
| Search / AI | Chất lượng, provenance, grounded evidence, no-answer có thay đổi không? |
| Existing consumers | Test/flow/module nào có thể bị regression? |
| Environment | Chỉ thay local development hay thực sự cần deployment? |

**Agent hỗ trợ:** Audit dependency graph, tra tài liệu khi cần và lập danh sách điểm bị ảnh hưởng kèm mức độ tin cậy. Nếu tác động lớn hơn dự kiến, agent phải báo để developer chọn lại scope.

**Tự kiểm tra:** Bạn biết **điều gì phải thay đổi** và **điều gì tuyệt đối không được hỏng**. Đừng lấy việc "test hiện tại vẫn xanh" làm bằng chứng rằng không có tác động nào khác.

**Kết quả:** Một phần *Impacted areas / Invariants / Risks* ngắn trong Issue; đủ chi tiết cho rủi ro thật, không phải báo cáo dài theo mẫu.

## 4. Thiết kế thay đổi — Just-enough Technical Design

**Developer làm gì:** Quyết định trách nhiệm của từng module, những thay đổi data/API và thứ tự tương tác. So sánh 1–2 hướng nếu có trade-off thật. **Không đưa thêm công nghệ mới chỉ vì agent biết dùng.**

**Agent hỗ trợ:** Đề xuất pseudocode, interfaces, API/schema changes, ví dụ request/response hoặc sơ đồ; chỉ ra trường hợp lỗi và giải thích vì sao một phương án phù hợp.

**Chọn sơ đồ theo câu hỏi:**

| Nếu chưa hiểu… | Sơ đồ thường giúp |
| --- | --- |
| Thứ tự gọi giữa UI, API, database và worker | **Sequence Diagram** |
| Trạng thái hợp lệ, archive/restore, retry, cancellation | **State Machine** |
| Thực thể/quan hệ dữ liệu thay đổi | **ERD hoặc Domain Model** |
| Quyền và ranh giới các thành phần đang đổi | **C4/Component** tại phần bị tác động |
| Nghiệp vụ có nhiều nhánh, phê duyệt | **Activity Diagram** |

**Tự kiểm tra:** Bạn có thể giải thích một request đi qua đâu, dữ liệu đổi thế nào, lỗi xảy ra thì sao? Nếu chỉ thay một nhãn UI, một đoạn mô tả là đủ; **không cần diagram/ADR**.

**Kết quả:** Thiết kế nhỏ trong Issue hoặc spec/architecture doc **chỉ khi hợp đồng cần lưu dài hạn**. Quyết định quan trọng phải được developer chấp thuận; chi tiết chưa cần được phép để mở.

## 5. Lập kế hoạch — Implementation Plan & Definition of Ready

**Developer làm gì:** Chia việc thành các bước có thể chạy và kiểm tra độc lập. Xác định files/modules dự kiến, dependencies, data migration nếu có, thứ tự an toàn, cách kiểm chứng và khi nào cần rollback. Ưu tiên một thay đổi end-to-end nhỏ thay vì sửa đồng loạt mọi tầng rồi cuối cùng mới test.

**Agent hỗ trợ:** Đề xuất task sequence, test cases, phân chia PR nếu scope lớn. Agent không được tự tạo thêm Issues/PRs hoặc đổi kiến trúc ngoài phạm vi được giao.

**Tự kiểm tra trước khi cho code (Definition of Ready):**
- [ ] Hành vi và acceptance đủ rõ để test.
- [ ] Đã tìm đúng code/contracts bị ảnh hưởng.
- [ ] Quyền, dữ liệu, concurrency, failure/compatibility được xem xét **nếu liên quan**.
- [ ] Những quyết định **chặn implementation** đã được giải quyết; phần có thể để sau được ghi rõ.
- [ ] Có kế hoạch test/regression và phạm vi agent được phép sửa.

**Kết quả:** Kế hoạch ngắn nằm trong Issue. Không cần tạo file planning phụ nếu Issue đã là nguồn công việc.

## 6. Implement & Test — Làm từng phần, xác minh thực tế

**Developer làm gì:** Cho agent (hoặc tự mình) implement **đúng phạm vi** trên branch phù hợp. Đọc diff sau từng thay đổi có ý nghĩa, chạy ứng dụng và kiểm thử. Tự thử happy path, lỗi, quyền và dữ liệu cũ khi có liên quan. Hỏi "vì sao đổi dòng này?" khi chưa hiểu.

**Agent hỗ trợ:** Code, viết/update unit/integration tests, chạy checks, tìm lỗi; báo cụ thể lệnh nào chạy, kết quả gì, những gì chưa chạy/không thể chạy. Không được tự khẳng định production-ready.

**Tự kiểm tra:** Tính năng mới chạy được end-to-end, test liên quan có evidence, các invariants không bị phá, không có file/dependency bất ngờ. Nếu một test chưa chạy thì giữ nguyên là **chưa kiểm chứng**.

**Kết quả:** Commit/diff có thể review và kết quả kiểm thử thực, không chỉ câu trả lời "đã xong" từ agent.

## 7. Review, Merge & Learn — Developer chịu trách nhiệm cuối

**Developer làm gì:** Review PR theo acceptance, tự đối chiếu code và tests với yêu cầu; kiểm tra compatibility, secrets, lỗi nghiêm trọng và khả năng rollback khi cần. Merge khi đạt yêu cầu. Sau đó cập nhật architecture/spec/ADR **nếu thật sự có tri thức ổn định mới**; không sao chép tiến độ Issue vào docs.

**Agent hỗ trợ:** Tóm tắt diff, chỉ ra rủi ro còn lại, đề xuất manual tests, viết mô tả PR và giải thích code. Agent không thay quyết định review của developer.

**Tự kiểm tra:** Bạn giải thích được *đã sửa cái gì, vì sao, test chứng minh gì, có thể hỏng ở đâu và hoàn tác thế nào*. Nếu còn điểm không giải thích được thì chưa cần approve.

**Kết quả:** PR có scope, test evidence, hạn chế còn lại; docs đúng với kiến trúc thực tế (nếu thay đổi). Chỉ deploy khi có yêu cầu; merge không có nghĩa đã deployed.

---

## Phân loại độ khó để tránh over-engineering

| Loại thay đổi | Chuẩn bị thường đủ |
| --- | --- |
| **Nhỏ** — đổi text, sửa validation cục bộ | Issue ngắn + impacted code + tests; **không cần sơ đồ** |
| **Vừa** — feature có API/database/workflow | Scope + impact + thiết kế data/flow (diagram nếu cần) + integration tests |
| **Lớn/rủi ro cao** — migration, quyền, trạng thái quan trọng | Current/target contracts + thiết kế cutover/rollback + failure/security + regression evidence |

*Lưu ý:* Một diff 5 dòng thay đổi authorization vẫn có thể rất rủi ro. Không đánh giá độ khó chỉ bằng số dòng code.

## Ví dụ giao agent theo từng bước

```text
Tôi đang ở Bước [1–7] của Playbook 2 — Phát triển tính năng.
Repository: [link]
Issue / mô tả: [link hoặc văn bản]
Đây là điều tôi đã hiểu và muốn giữ nguyên: [tóm tắt].

Hãy chỉ hỗ trợ Bước [số]:
- Kiểm tra code và tài liệu liên quan, không suy đoán.
- Giải thích ngắn gọn: hiện tại → đề xuất thay đổi → tác động/rủi ro.
- Chỉ vẽ sơ đồ khi nó giải quyết một câu hỏi thiết kế thực sự.
- Nêu cách tôi tự kiểm chứng, phân biệt đã test/chưa test.
- Không sửa code, Issue hoặc tài liệu nếu chưa được phép.

Kết thúc với những quyết định tôi phải chốt và điều có thể để sau.
```

## Sau tính năng này thì sao?

Mỗi tính năng tiếp theo dùng lại Playbook 2 **ở những bước có ý nghĩa với thay đổi mới**, không lập lại hệ thống từ con số 0. Nếu đang muốn tạo một sản phẩm mới, quay về [Playbook 1](project-start-playbook.md). Nếu gặp quyết định kiến trúc mới từ thực tế, cập nhật đúng tri thức đã được xác minh và giữ đường migration/rollback rõ ràng.

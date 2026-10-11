# Playbook 1 — Phát triển dự án từ con số 0

> **Dành cho developer, không phải lệnh để agent tự chạy toàn bộ.** Bạn là người hiểu bài toán, chọn hướng đi, đọc/duyệt thiết kế, kiểm thử và chịu trách nhiệm với kết quả. Agent là người hỗ trợ phân tích, phản biện, vẽ sơ đồ, code và kiểm thử **trong phạm vi bạn cho phép**.
>
> Đây là **hướng dẫn thao tác từng bước dành cho developer**. Bạn hiểu và quyết định trước, agent hỗ trợ sau. Tài liệu này tự dùng được, không phụ thuộc vào các skill hoặc workflow chưa được triển khai.

## Cách sử dụng

- **Bắt đầu với ý tưởng:** thực hiện Bước 1–8 theo thứ tự hợp lý, sau đó hoàn thiện và kiểm thử vertical slice đầu tiên ở Bước 9. Mỗi bước có thể ngắn nếu dự án đơn giản.
- **Đã có project và muốn thêm/sửa tính năng:** chuyển sang [Playbook 2 — Phát triển tính năng](feature-development-playbook.md), không khởi động lại toàn bộ dự án. Nếu đổi kiến trúc lớn, cần phân tích tác động, migration và rollback riêng.
- **Chỉ sang bước tiếp theo khi bạn giải thích được quyết định quan trọng** và kiểm tra được kết quả của bước hiện tại. Chưa biết thì ghi "chưa quyết định" — không đoán.
- **Dữ liệu không nhất thiết phải là file:** một ý tưởng nhỏ có thể bắt đầu bằng vài dòng trong Issue; chỉ đưa tri thức ổn định vào đúng chỗ khi cần.

## Bản đồ 9 bước

| Bước | Developer cần trả lời | Đầu ra tối thiểu |
| --- | --- | --- |
| 1. Làm rõ ý tưởng | Đang giải quyết vấn đề gì và cho ai? | 1 đoạn mô tả, mục tiêu |
| 2. Chốt MVP | Luồng nhỏ nhất người dùng cần là gì? | Use cases / in-out scope |
| 3. Xác định yêu cầu | Hệ thống phải làm gì, tốt đến mức nào? | Hành vi có thể kiểm thử, constraints |
| 4. Phác thảo hệ thống | Ai tương tác với hệ thống? Các khối chịu trách nhiệm gì? | Ranh giới + sơ đồ cần thiết |
| 5. Thiết kế dữ liệu & luồng | Dữ liệu nằm ở đâu; một thao tác diễn ra thế nào? | Domain/ERD, sequence/state *nếu cần* |
| 6. Ra quyết định kỹ thuật | Vì sao chọn stack, bảo mật, vận hành dev như vậy? | Các quyết định lớn + rủi ro |
| 7. Lập kế hoạch triển khai | Xây luồng chạy được đầu tiên bằng cách nào? | Vertical slices, Issues, acceptance |
| 8. Chuẩn bị repo & môi trường | Dev/agent chạy, test, review ở đâu? | Repo, quy tắc, local run/test |
| 9. Code → test → review → học | Thứ gì thực sự hoạt động và được chứng minh? | PR, test evidence, phản hồi |

## 1. Làm rõ ý tưởng — Product Problem

**Bạn làm:** Viết 3–5 câu: ai gặp vấn đề gì, hiện họ xử lý ra sao, sản phẩm giúp gì, thành công nhận biết thế nào. Chưa chọn framework hay vẽ database.

**Agent hỗ trợ:** Hỏi những chỗ thực sự thiếu; nêu giả định và phản biện về người dùng/giá trị. Không tự bịa thị trường, người dùng hoặc thành công đã được kiểm chứng.

**Tự kiểm tra:** Bạn diễn đạt được vấn đề mà không nhắc đến tên công nghệ.

*Ví dụ PDF Q&A:* "Người dùng cần tìm câu trả lời từ PDF dài. Thành công: đặt một câu hỏi và nhận đúng đoạn nguồn/trang để kiểm chứng."

## 2. Chốt MVP — Actors, Use Cases và ranh giới

**Bạn làm:** Liệt kê người dùng/vai trò và các hành động chính. Chọn **một hành trình end-to-end nhỏ nhất** có giá trị. Ghi rõ **làm ngay / để sau / không làm**. Một Use Case Diagram giúp ích khi có nhiều vai trò/quyền, không phải luôn phải vẽ.

**Agent hỗ trợ:** Đề xuất user journey, phát hiện các vai trò/luồng bị quên và những tính năng chưa cần thiết. Bạn duyệt danh sách.

**Tự kiểm tra:** Nếu chưa có các tính năng "để sau", người dùng vẫn hoàn thành được việc quan trọng nhất không?

*Ví dụ:* MVP = chọn 1 PDF → upload → hỏi → nhận câu trả lời có dẫn trang. Chưa cần admin analytics hoặc multi-workspace sharing.

## 3. Viết yêu cầu — Requirements

**Bạn làm:** Viết điều kiện quan sát được: đầu vào, đầu ra, lỗi, ranh giới quyền truy cập. Tách **functional** (hệ thống làm gì) và **non-functional** (bảo mật, tốc độ, độ tin cậy, chi phí…) **thực sự quan trọng cho MVP**. Không đặt số SLO tùy tiện.

**Agent hỗ trợ:** Chuyển ý tưởng thành các tình huống Given/When/Then, hỏi về empty/error cases, đề xuất cách test. Đánh dấu giả định chưa xác minh.

**Tự kiểm tra:** Người khác có thể dựa vào yêu cầu để biết chương trình làm đúng hay sai không?

*Ví dụ:* PDF không đọc được → báo lỗi rõ; câu hỏi không có căn cứ → từ chối; citation trỏ đúng tài liệu/trang; không trả tài liệu của người khác.

**Nơi lưu:** `PROJECT-OVERVIEW.md` giữ mục đích/phạm vi đã xác nhận; quy tắc hành vi quan trọng, dùng lại lâu dài mới đưa vào `docs/05-specs/`.

## 4. Phác thảo kiến trúc — System Boundaries

**Bạn làm:** Trả lời: người dùng đi vào đâu, thành phần nào giữ nghiệp vụ, ai lưu dữ liệu, có dịch vụ ngoài nào, ai tin cậy ai. Bắt đầu bằng **một hình có vài hộp và mũi tên**. Chưa cần thiết kế class hoặc mọi endpoint.

**Agent hỗ trợ:** Đề xuất C4 System Context (ranh giới ngoài) hoặc C4 Container (các ứng dụng/database chạy riêng) **nếu giúp giảm hiểu nhầm**; chỉ ra chỗ có thể lẫn ownership hoặc trust boundaries.

**Tự kiểm tra:** Bạn giải thích được vai trò của từng hộp và đường dữ liệu chính. Nếu bỏ một hộp, điều gì hỏng?

*Ví dụ:* Browser → API xử lý quyền/logic → database tài liệu và search index → model inference; chỗ nào quyết định quyền phải rõ.

## 5. Thiết kế dữ liệu, tương tác và vòng đời

**Bạn làm:** Xác định 3 điều cốt lõi:

1. **Dữ liệu:** các thực thể, quan hệ, khóa/identity; đâu là nguồn sự thật; vòng đời dữ liệu.
2. **Một luồng quan trọng:** ai gọi ai, thứ tự, dữ liệu truyền qua, lỗi xảy ra ở đâu.
3. **Trạng thái dài hạn (nếu có):** queued/processing/completed/failed; ai được đổi trạng thái, retry/cancel/recovery hoạt động thế nào.

**Agent hỗ trợ:** Dự thảo ERD/domain model, sequence hoặc state diagram **theo chỗ cần giải thích**; review missing race conditions, validation, quyền và khả năng khôi phục. Bạn phải hiểu từng chuyển trạng thái và mối quan hệ trước khi duyệt.

**Tự kiểm tra:** Bạn có thể theo dấu một thao tác từ đầu đến cuối, kể cả một trường hợp lỗi. Không cần vẽ state diagram nếu không có state machine đáng kể.

*Ví dụ:* Document → Version → Chunks; upload → lưu file → xử lý → tìm kiếm được; thất bại khi xử lý thì UI hiện gì, retry ở đâu?

## 6. Quyết định công nghệ & rủi ro — Trade-offs

**Bạn làm:** Với mỗi lựa chọn **ảnh hưởng lớn**, ghi: vấn đề cần giải quyết, tối đa 2 phương án hợp lý, vì sao chọn, đánh đổi gì, cái gì để sau. Kiểm tra tương thích với dữ liệu, team, máy dev, ngân sách. Chỉ thiết kế **local development** nếu chưa đến giai đoạn deployment.

**Agent hỗ trợ:** Research tài liệu/benchmark khi cần, chỉ ra giới hạn bằng chứng và đề xuất thử nghiệm nhỏ. Không tự chuyển "đề xuất" thành "đã chốt".

**Tự kiểm tra:** Bạn trả lời được "tại sao dùng X thay Y?" và "đổi X sau này sẽ ảnh hưởng phần nào?". Quyết định lớn đã được review; thứ chưa cần có thể để mở.

**Nơi lưu:** Kiến trúc đã chốt ở `docs/02-architecture/`; lý do lựa chọn quan trọng ở `docs/06-decisions/` khi cần ADR. Không tạo ADR cho mỗi package.

## 7. Lập kế hoạch bằng vertical slices — Không code từng tầng rồi mới ghép

**Bạn làm:** Chia thành những **luồng nhỏ chạy từ input tới kết quả có thể kiểm tra**, không chia dự án thành "làm hết database → hết backend → hết frontend". Bước đầu chọn luồng đơn giản nhất. Ghi dependencies và **Definition of Ready** cho Issue.

**Agent hỗ trợ:** Đề xuất milestones và Issues, acceptance tests và thứ tự an toàn. Đề xuất không đồng nghĩa đã được phép tạo Issues.

**Tự kiểm tra:** Mỗi slice có demo/test rõ; hoàn thành slice 1 sẽ có cái chạy được dù slice 2 chưa tồn tại.

*Ví dụ:* Slice 1: upload một tài liệu mẫu và hỏi ra một câu trả lời có citation. Slice sau mới bổ sung multi-tenant, rerank hay monitoring.

## 8. Chuẩn bị repository, môi trường và điểm kiểm soát

**Bạn làm:** Khởi tạo hoặc kiểm tra repo, README hướng dẫn chạy local, env/secrets, lệnh run/test, quy tắc branch/PR. Chỉ scaffold thành phần dùng trong slice đầu. Xác định agent được sửa nhánh/file nào và điều gì phải hỏi trước.

**Agent hỗ trợ:** Tạo scaffolding trong **phạm vi đã cho phép**, chạy smoke tests và chỉ ra thiết lập thiếu; không tự triển khai cloud, thêm services hoặc sửa main khi không cần.

**Tự kiểm tra:** Từ clean checkout, bạn biết cách chạy bản nhỏ nhất và chạy test; secret không commit; có thể review diff và rollback.

**Nơi lưu:** `AGENTS.md` là agent routing; `CONTEXT.md` là trạng thái ngắn; Issues cho kế hoạch/trạng thái, PRs cho code và test evidence. Không tạo task tracker thứ hai.

## 9. Triển khai, kiểm thử, review, học và lặp

**Bạn làm:** Trước khi code, đọc yêu cầu/Issue, mô tả cách mình định triển khai, kiểm tra hợp đồng liên quan. Sau khi agent code: **đọc diff, chạy ứng dụng, chạy tests, thử lỗi và kiểm tra dữ liệu/quyền**. Bạn review PR rồi mới merge. Sau phản hồi, điều chỉnh requirement/architecture nếu chứng cứ thay đổi.

**Agent hỗ trợ:** Audit code, đề xuất plan, implement từng phần, viết và chạy tests, giải thích trade-offs, tự review diff, soạn PR. Agent phải báo rõ cái gì **đã test**, cái gì **chưa test**, và các giả định.

**Tự kiểm tra:** Bạn có thể giải thích code đã thay đổi chỗ nào, tại sao, tác động gì, cách phát hiện lỗi và cách hoàn tác. Nếu không giải thích được, chưa nên approve PR.

**Đi tiếp:** Sau khi vertical slice đầu tiên chạy và được kiểm chứng, dùng [Playbook 2 — Phát triển tính năng](feature-development-playbook.md) cho từng thay đổi tiếp theo. Khi thay đổi kiến trúc lớn, phân tích current/target, migration, security, rollback và regression trước khi code. Chỉ thiết kế deployment khi có nhu cầu thực tế.

---

## Chọn sơ đồ thế nào để không bị over-engineering?

Đừng hỏi "dự án cần vẽ bao nhiêu sơ đồ". Hỏi "mình đang không hiểu điều gì?".

| Bạn chưa hiểu… | Hãy dùng |
| --- | --- |
| Ai có chức năng/quyền gì? | Use Case Diagram |
| Ranh giới sản phẩm với người dùng/hệ thống ngoài | C4 System Context |
| Frontend, API, DB, service nào nói chuyện với nhau | C4 Container |
| Dữ liệu, quan hệ và nguồn sự thật | Domain Model / ERD |
| Thứ tự lời gọi trong một luồng | Sequence Diagram |
| Trạng thái, retry, activation | State Machine |
| Quy trình nghiệp vụ có nhiều ngã rẽ | Activity Diagram |
| Module bên trong một service quá khó hiểu | Component Diagram |
| Chạy ở máy/container/network nào | Deployment Diagram |

Mermaid trong Markdown là đủ khi không cần công cụ vẽ chuyên dụng. Không vẽ diagram cho thứ có thể giải thích rõ trong vài dòng. Nhãn **Proposed** và **Current** phải khác nhau.

## Developer tự kiểm tra trước khi giao agent làm tiếp

Chỉ cần tự trả lời được 6 câu (không phải một form bắt buộc):

1. **WHY:** Tại sao mình xây việc này? Ai hưởng lợi?
2. **WHAT:** Bản nhỏ nhất làm được việc gì? Không làm gì?
3. **HOW:** Các thành phần nào phối hợp; dữ liệu/quyền do đâu quyết định?
4. **RISK:** Trường hợp sai, lỗi, mất dữ liệu, phá tương thích sẽ thế nào?
5. **VERIFY:** Test/demo nào chứng minh đã làm đúng?
6. **CONTROL:** Agent được sửa gì, khi nào phải xin mình duyệt?

Nếu một câu chưa trả lời được **và nó chặn việc code an toàn**, quay lại đúng bước tương ứng. Nếu chưa cần thiết cho slice hiện tại, để `UNRESOLVED` và tiếp tục.

## Ví dụ lệnh giao agent — sau khi developer đã hiểu nhiệm vụ

```text
Tôi đang ở Bước [số] trong Developer Playbook.
Đây là quyết định/thiết kế hiện tại: [trích hoặc link nguồn].
Tôi muốn đạt đầu ra: [mô tả].

Hãy:
- Kiểm tra điều tôi đã hiểu đúng/sai và nêu rủi ro bỏ sót.
- Đề xuất phương án đơn giản nhất và giải thích vì sao.
- Chỉ vẽ sơ đồ nếu nó giúp trả lời một câu hỏi thiết kế cụ thể.
- Phân biệt VERIFIED / INFERRED / UNRESOLVED / CONFLICT.
- Nêu cách tôi tự xác minh kết quả.
- Chưa code/chỉnh file/tạo Issue/PR nếu tôi chưa cho phép.

Kết thúc bằng: điều tôi cần quyết định; điều có thể để sau.
```

## Chuyển sang phát triển tính năng

Khi MVP đã có nền tảng và bạn muốn thêm, sửa hoặc refactor một tính năng trong hệ thống đang tồn tại, hãy chuyển sang [Playbook 2 — Phát triển tính năng](feature-development-playbook.md). Không lặp lại Discovery, Use Case hay Container Diagram của toàn dự án nếu thay đổi chỉ giới hạn ở một phần.

## Playbook này nên được dùng như thế nào?

- **Developer:** dùng hướng dẫn này để chủ động xác định câu hỏi, phác thảo thiết kế, chọn bước tiếp theo và kiểm tra kết quả.
- **Agent:** chỉ hỗ trợ trong phạm vi developer giao, giải thích đề xuất và cung cấp bằng chứng; không tự chốt kiến trúc hoặc tuyên bố đã kiểm thử.
- **Repository dự án:** lưu thông tin sản phẩm, quyết định thực tế và code/tests tại nơi phù hợp; không sao chép toàn bộ Playbook vào từng Issue hoặc tạo tài liệu chỉ để đủ mẫu.

**Lưu ý:** Đây là quy trình học và làm việc có thể lặp lại, không phải lời hứa rằng vẽ sơ đồ trước sẽ tránh hoàn toàn refactor. Thiết kế tốt là thiết kế có thể thay đổi an toàn khi hiểu biết mới xuất hiện.

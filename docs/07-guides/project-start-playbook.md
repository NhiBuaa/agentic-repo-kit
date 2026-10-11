# Playbook 1 — Bắt đầu dự án từ con số 0

**Dành cho developer:** tạo repo trước, rồi thiết kế nền tảng: **giá trị cốt lõi → Use Case Diagram → UI/UX tổng quan (nếu có giao diện) → System Architecture → công nghệ → database → phases (MVP trước)**. Requirements, Workflow kiến trúc và thiết kế UI chi tiết theo từng tính năng thuộc **[Playbook 2](feature-development-playbook.md)**.

**Cách làm xuyên suốt:** Sau mỗi bước, khi bạn cho phép, agent ghi **bản nháp vào đúng nơi trong repo** và đưa diff/PR để developer **đọc → sửa → duyệt**. Chỉ dùng quyết định đã được duyệt làm cơ sở cho bước tiếp theo. Không tạo file trống hay sao chép cùng nội dung nhiều nơi.

## 8 bước thực hiện

### 1. Khởi tạo repository

- **Bạn làm:** Tạo GitHub repo, đặt tên và viết README mô tả tạm 1–2 dòng; dùng branch/PR để review các thay đổi. Chưa cần chốt stack hay dựng toàn bộ source code.
- **Agent giúp:** Đề xuất cấu trúc tối thiểu; chỉ tạo/sửa file khi được bạn cho phép.
- **Xong khi:** Repo sẵn sàng để lưu và review kết quả các bước tiếp theo.

**Ghi ở đâu?** `PROJECT-OVERVIEW.md` cho mục tiêu và quyết định nền tảng; `docs/` cho thiết kế ổn định; GitHub Issues/PRs cho công việc, thay đổi và review. Chỉ tạo tài liệu khi có nội dung.

### 2. Xác định ý tưởng và giá trị cốt lõi

- **Bạn làm:** Viết ngắn gọn **ai sẽ dùng sản phẩm, họ gặp vấn đề gì, sản phẩm giải quyết được điều gì quan trọng nhất**. Ghi vào `PROJECT-OVERVIEW.md` để review.
- **Agent giúp:** Hỏi lại khi vấn đề hoặc giá trị cốt lõi chưa rõ.
- **Xong khi:** Bạn mô tả được **một kết quả chính** mà sản phẩm phải mang lại, không cần nói về công nghệ.

*Ví dụ:* Người dùng có nhiều PDF và khó tìm thông tin. Giá trị cốt lõi: **hỏi nội dung PDF và nhận câu trả lời có trích dẫn để kiểm chứng**.

### 3. Vẽ Use Case Diagram

- **Bạn làm:** **Vẽ sơ đồ Use Case** với actor (ai sử dụng), ranh giới hệ thống và các chức năng actor có thể thực hiện. Bao gồm chức năng cần cho giá trị cốt lõi và các chức năng dự kiến mở rộng; lưu sơ đồ trong `docs/03-product/` để review.
- **Agent giúp:** Phát hiện actor hoặc use case bị thiếu; giữ sơ đồ dễ đọc.
- **Xong khi:** Có **Use Case Diagram được bạn duyệt**, thể hiện rõ ai sử dụng chức năng nào.

*Ví dụ:* Actor **Người dùng** liên kết với các use case **Upload PDF**, **Đặt câu hỏi**, **Xem trích dẫn**, **Quản lý hội thoại**. Việc chọn chức năng nào thuộc MVP sẽ chốt ở Bước 8.

### 4. Thiết kế UI/UX tổng quan (với ứng dụng có giao diện)

- **Bạn làm:** Từ Use Case Diagram và giá trị cốt lõi, xác định **cấu trúc điều hướng** (các khu vực/màn hình chính) và vẽ **User Flow chính**: người dùng đi qua những bước nào để hoàn thành việc quan trọng nhất.
- **Agent giúp:** Gợi ý cách điều hướng dễ hiểu, phát hiện bước thừa hoặc điểm người dùng bị kẹt.
- **Xong khi:** Bạn chỉ được người dùng bắt đầu ở đâu và đi qua những bước nào để đạt giá trị cốt lõi.

*Ví dụ:* Workspace → chọn Upload → chọn PDF → xem tiến trình xử lý → nhận kết quả → đặt câu hỏi.

**Chưa cần wireframe từng màn hình, đầy đủ UI states hay prototype tại đây.** Thiết kế chúng khi làm tính năng ở [Playbook 2](feature-development-playbook.md). Nếu dự án không có giao diện người dùng (chỉ API/backend), bỏ qua bước này.

### 5. Thiết kế System Architecture

- **Bạn làm:** Dựa trên giá trị cốt lõi và Use Case Diagram, vẽ các thành phần chính của hệ thống (frontend, backend, database, storage, dịch vụ ngoài nếu cần), trách nhiệm và kết nối. Đưa bản nháp vào `docs/02-architecture/` để review.
- **Agent giúp:** Đề xuất cách chia trách nhiệm, giải thích các kết nối và điểm chưa hợp lý.
- **Xong khi:** Bạn giải thích được cấu trúc chung của hệ thống.

*Ví dụ:* Frontend ↔ Backend ↔ Database; Backend ↔ File Storage; Backend ↔ AI Service.

**Chưa cần vẽ Workflow của từng chức năng tại đây.**

### 6. Chọn công nghệ

- **Bạn làm:** Dựa trên các use case, dữ liệu cần xử lý và System Architecture, chọn công nghệ cho frontend, backend, **loại database (SQL/NoSQL)** và các phần cần thiết; ghi ngắn gọn lý do.
- **Agent giúp:** So sánh phương án theo dữ liệu, cách truy vấn và độ phức tạp thực tế.
- **Xong khi:** Bạn biết dùng công nghệ gì và vì sao, đặc biệt là loại database.

*Ví dụ:* Next.js + FastAPI; chọn PostgreSQL nếu cần dữ liệu quan hệ hoặc MongoDB nếu mô hình document phù hợp. Không thêm công nghệ chỉ để cho đủ stack.

### 7. Thiết kế database theo công nghệ đã chọn

- **Bạn làm:** Dựa trên Use Case Diagram, kiến trúc và **loại database ở Bước 6**, thiết kế dữ liệu cần cho MVP và các quan hệ cốt lõi trước khi code:
  - **SQL (PostgreSQL, MySQL...):** Bắt buộc có **ERD + Relational Schema** (bảng, cột, PK, FK).
  - **NoSQL dạng document (MongoDB...):** Thiết kế **collections, cấu trúc documents, embedded/reference và indexes cần thiết**. Không ép vẽ Relational Schema.
- **Agent giúp:** Đề xuất cấu trúc và rà soát nó có đáp ứng cách đọc/ghi dữ liệu không.
- **Xong khi:** Bạn hiểu dữ liệu lưu thế nào và đã review thiết kế trong `docs/02-architecture/`.

Nếu không dùng database, ghi rõ không áp dụng. Các sơ đồ khác chỉ bổ sung khi thực sự cần.

### 8. Lập kế hoạch theo phases triển khai

- **Bạn làm:** Lấy **giá trị cốt lõi ở Bước 2** làm mục tiêu cho **MVP**: bản đầu tiên mà người dùng thực sự hoàn thành được việc chính. Chia công việc thành **Phase 1 (MVP)** rồi các phase mở rộng, theo thứ tự phụ thuộc. Mỗi phase cần ghi rõ **mục tiêu, chức năng, demo phải chạy được và các trường hợp cần test**. Tạo GitHub Issues; developer review, chỉnh sửa và duyệt kế hoạch trước khi code.
- **Agent giúp:** Gợi ý phạm vi MVP nhỏ nhất nhưng đủ giá trị, thứ tự phụ thuộc và cách demo/test từng phase.
- **Xong khi:** Có kế hoạch theo phases; **mỗi phase có kết quả demo/test cụ thể**, và MVP chứng minh được giá trị cốt lõi.

*Ví dụ — Ứng dụng hỏi đáp PDF:*
- **Phase 1 — MVP:** Upload PDF → đặt câu hỏi → nhận câu trả lời có trích dẫn. **Demo:** Upload một PDF và hỏi một câu có thể đối chiếu với nguồn. **Test:** File không hợp lệ bị từ chối; câu trả lời hiển thị được nguồn.
- **Phase 2 — Mở rộng:** Quản lý tài liệu và lịch sử hội thoại. **Demo:** Xem lại tài liệu và cuộc trò chuyện đã lưu. **Test:** Dữ liệu lưu và tải lại đúng, người dùng không xem được dữ liệu của người khác.

**MVP không chỉ là phần mềm chạy được:** nó phải giải quyết **đúng vấn đề chính ở Bước 2**. Các tính năng khác tiếp tục ở phase sau.

Sau khi kế hoạch được duyệt, bắt đầu Issue đầu tiên của **Phase 1** bằng **[Playbook 2 — Phát triển tính năng](feature-development-playbook.md)**. Workflow và Requirements chi tiết được thiết kế khi thực hiện từng tính năng, không làm trước cho toàn bộ hệ thống.

## Trước khi chuyển sang code, tự hỏi

**Tôi đã chốt giá trị cốt lõi, Use Case Diagram và User Flow chính (nếu có UI) chưa? Kiến trúc, công nghệ, database đã rõ chưa? Phase MVP có demo/test chứng minh được giá trị đó chưa?**

Nếu chưa trả lời được câu liên quan trực tiếp đến phần sắp code, quay lại bước tương ứng. **Developer quyết định; agent hỗ trợ.**

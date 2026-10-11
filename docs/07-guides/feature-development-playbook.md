# Playbook 2 — Phát triển một tính năng

**Dành cho developer:** triển khai **từng tính năng**, kể cả tính năng đầu tiên. Dựa trên kiến trúc, database và User Flow tổng quan (nếu có UI) để thiết kế đúng phần cần làm. Agent chỉ sửa repo khi được phép; bạn xem diff, chỉnh sửa và duyệt trước khi code. Không thiết kế lại cả dự án.

Nếu bắt đầu với một ý tưởng chưa có dự án, xem [Playbook 1 — Bắt đầu từ con số 0](project-start-playbook.md).

## 6 bước thực hiện

### 1. Xem kiến trúc và code liên quan

- **Bạn làm:** Đọc System Architecture, **thiết kế dữ liệu tương ứng với database đang dùng** và code/test liên quan nếu đã có. Với tính năng đầu tiên, dựa trên thiết kế đã chốt ở Playbook 1.
- **Agent giúp:** Chỉ ra thành phần nào xử lý tính năng và giải thích code hiện tại.
- **Xong khi:** Bạn biết tính năng sẽ nằm ở đâu, dữ liệu liên quan là gì.

*Ví dụ:* Trước khi thêm Archive Conversation, xem nơi lưu Conversation và API lấy danh sách.

### 2. Ghi rõ yêu cầu của tính năng

- **Bạn làm:** Với tính năng đang triển khai, ghi rõ **đầu vào/dữ liệu cần xử lý, kết quả mong đợi, quy tắc, lỗi và quyền truy cập liên quan**. Nếu có UI, ghi rõ thao tác người dùng.
- **Agent giúp:** Gợi ý trường hợp còn thiếu và cách kiểm thử.
- **Xong khi:** Có thể xác định tính năng đã làm đúng hay chưa.

*Ví dụ — Archive Conversation:* Bấm Archive thì cuộc trò chuyện rời danh sách đang hoạt động nhưng vẫn xem được trong Archived; người không có quyền không được archive.

Đây là **Requirements chi tiết của tính năng**. Ghi vào GitHub Issue đủ rõ để test, không bắt buộc spec riêng. Nếu phát sinh actor/chức năng mới, cập nhật **Use Case Diagram** của dự án khi cần.

### 3. Xem thay đổi ảnh hưởng những đâu

- **Bạn làm:** Kiểm tra có phải sửa UI, API, database, quyền truy cập hoặc xử lý nền không. Xác định chức năng cũ nào phải tiếp tục hoạt động.
- **Agent giúp:** Tìm chỗ gọi tới code đó và rủi ro bị ảnh hưởng.
- **Xong khi:** Bạn biết cần sửa những phần nào và cần giữ nguyên những gì.

*Ví dụ:* Archive có thể cần một cột trạng thái trong database, cập nhật API và lọc danh sách trên UI.

### 4. Vẽ hoặc cập nhật Workflow kiến trúc của tính năng

- **Bạn làm:** Thể hiện **frontend/API/backend/database/worker liên quan** và các bước chúng xử lý, gọi nhau, truyền dữ liệu; từ đó xác định code/API cần sửa.
- **Agent giúp:** Giải thích luồng trong code hiện tại, đề xuất cách thay đổi đơn giản.
- **Xong khi:** Bạn hiểu phần nào thay đổi và dữ liệu được xử lý ra sao; Workflow/thiết kế liên quan đã được bạn review và duyệt.

*Ví dụ — Archive Conversation:* Frontend → API → kiểm tra quyền → Backend cập nhật trạng thái trong Database → API trả kết quả → Frontend cập nhật danh sách.

**Nếu có UI:** Dựa trên User Flow tổng quan, thiết kế **wireframe/màn hình cần sửa** và các **UI states** liên quan (ví dụ: Loading, Success, Failed, Empty). Làm **prototype để thử luồng khi tương tác chưa rõ**; không bắt buộc cho mọi tính năng. Developer duyệt trước khi code.

**Nếu thay đổi cấu trúc database:** Cập nhật **ERD + Relational Schema** với SQL; hoặc **collection/document schema và indexes liên quan** với MongoDB. Không thay đổi dữ liệu thì không vẽ lại. Với tính năng đầu tiên, dùng thiết kế đã duyệt ở Playbook 1.

**Sequence/State Diagram chỉ bổ sung nếu thật sự cần.** Thay công nghệ/kiến trúc lớn thì xem thêm cách chuyển dữ liệu cũ và rollback.

### 5. Chia việc và triển khai

- **Bạn làm:** Sau khi duyệt thiết kế, chia việc trong Issue, nêu cách test từng phần rồi code trên branch riêng. Review diff khi agent thay đổi code.
- **Agent giúp:** Đề xuất kế hoạch, code và viết test đúng phạm vi được giao.
- **Xong khi:** Tính năng chạy được, các trường hợp quan trọng đã được kiểm tra, không có thay đổi ngoài yêu cầu.

*Ví dụ:* Cập nhật database/API → test quyền và archive/restore → cập nhật UI → thử toàn bộ luồng.

### 6. Kiểm tra kết quả và review PR

- **Bạn làm:** Chạy ứng dụng, thử đúng/lỗi/quyền khi liên quan, đọc diff và kiểm tra chức năng cũ. Chỉ merge khi bạn hiểu thay đổi.
- **Agent giúp:** Tổng hợp những gì đã sửa, kết quả test và điểm chưa kiểm chứng.
- **Xong khi:** PR rõ ràng, tests có kết quả thực, bạn tự xác nhận chức năng đạt yêu cầu.

Nếu kiến trúc hoặc cách dùng đã thay đổi, cập nhật **đúng tài liệu liên quan**; không tạo bản sao của Issue trong `docs/`.

## Trước khi giao agent code, tự hỏi

**Tôi hiểu kiến trúc và code liên quan chưa? Yêu cầu đúng là gì? Workflow kỹ thuật và màn hình/trạng thái UI (nếu có) đã rõ chưa? Kiểm tra thế nào?**

Nếu chưa rõ, yêu cầu agent **giải thích hoặc phân tích**, chưa yêu cầu code. Developer vẫn là người duyệt thiết kế và kết quả.

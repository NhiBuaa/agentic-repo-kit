# Playbook 2 — Phát triển một tính năng

**Dành cho developer:** dùng khi dự án đã có code và bạn muốn thêm, sửa hoặc cải thiện một chức năng. **Không cần thiết kế lại cả dự án.** Bạn hiểu và kiểm tra công việc; agent chỉ hỗ trợ trong phạm vi được giao.

Nếu bắt đầu với một ý tưởng chưa có dự án, xem [Playbook 1 — Bắt đầu từ con số 0](project-start-playbook.md).

## 6 bước thực hiện

### 1. Tìm hiểu chức năng hiện tại

- **Bạn làm:** Tìm màn hình/API, code, database và test liên quan. Xem hiện tại hệ thống xử lý thế nào.
- **Agent giúp:** Dẫn bạn đến đúng file và giải thích đường đi của dữ liệu.
- **Xong khi:** Bạn nói được chức năng hiện đang hoạt động ra sao, phần nào chịu trách nhiệm.

*Ví dụ:* Trước khi thêm Archive Conversation, hãy biết Conversation lưu ở bảng nào và API nào đang lấy danh sách.

### 2. Viết rõ thay đổi cần làm

- **Bạn làm:** Ghi **người dùng thao tác gì → hệ thống phải làm gì → trường hợp lỗi ra sao**. Đây là yêu cầu (requirements) của tính năng.
- **Agent giúp:** Hỏi trường hợp còn thiếu, gợi ý cách kiểm tra.
- **Xong khi:** Có thể thử và kết luận chức năng đúng hay sai.

*Ví dụ — Archive Conversation:*
- Bấm Archive → cuộc trò chuyện biến mất khỏi danh sách đang hoạt động.
- Mở danh sách Archived → vẫn xem được cuộc trò chuyện.
- Người không có quyền → không thể archive.

Ghi các điều này trong **GitHub Issue** để tránh hiểu khác nhau khi code.

### 3. Xem thay đổi ảnh hưởng những đâu

- **Bạn làm:** Kiểm tra có phải sửa UI, API, database, quyền truy cập hoặc xử lý nền không. Xác định chức năng cũ nào phải tiếp tục hoạt động.
- **Agent giúp:** Tìm chỗ gọi tới code đó và rủi ro bị ảnh hưởng.
- **Xong khi:** Bạn biết cần sửa những phần nào và cần giữ nguyên những gì.

*Ví dụ:* Archive có thể cần một cột trạng thái trong database, cập nhật API và lọc danh sách trên UI.

### 4. Thiết kế cách thực hiện

- **Bạn làm:** Chốt sẽ sửa những thành phần nào, dữ liệu thay đổi ra sao, thao tác chạy theo thứ tự nào.
- **Agent giúp:** Đề xuất cách làm đơn giản, ví dụ code/API hoặc **một sơ đồ nếu cần**.
- **Xong khi:** Bạn hiểu cách làm và giải thích được vì sao chọn cách đó.

Chỉ vẽ khi thật sự cần: **ERD** nếu dữ liệu đổi, **Sequence** nếu nhiều thành phần gọi nhau, **State Machine** nếu có trạng thái phức tạp. Thay đổi nhỏ không cần sơ đồ.

Nếu phải thay công nghệ/kiến trúc lớn, hãy kiểm tra thêm dữ liệu cũ, cách chuyển đổi, lỗi và cách quay về bản cũ **trước khi code**.

### 5. Chia việc và triển khai

- **Bạn làm:** Chia thành các bước nhỏ trong Issue; nêu cách test mỗi bước. Sau đó code trên branch riêng.
- **Agent giúp:** Đề xuất kế hoạch, code và viết test đúng phạm vi được giao.
- **Xong khi:** Tính năng chạy được, các trường hợp quan trọng đã được kiểm tra, không có thay đổi ngoài yêu cầu.

*Ví dụ:* Cập nhật database/API → test quyền và archive/restore → cập nhật UI → thử toàn bộ luồng.

### 6. Kiểm tra kết quả và review PR

- **Bạn làm:** Chạy ứng dụng, thử đúng/lỗi/quyền khi liên quan, đọc diff và kiểm tra chức năng cũ. Chỉ merge khi bạn hiểu thay đổi.
- **Agent giúp:** Tổng hợp những gì đã sửa, kết quả test và điểm chưa kiểm chứng.
- **Xong khi:** PR rõ ràng, tests có kết quả thực, bạn tự xác nhận chức năng đạt yêu cầu.

Nếu kiến trúc hoặc cách dùng đã thay đổi, cập nhật **đúng tài liệu liên quan**; không tạo bản sao của Issue trong `docs/`.

## Trước khi giao agent code, tự hỏi

**Tôi hiểu code cũ chưa? Tính năng mới phải làm gì? Sửa phần nào? Kiểm tra thế nào?**

Nếu chưa rõ, yêu cầu agent **giải thích hoặc phân tích**, chưa yêu cầu code. Developer vẫn là người duyệt thiết kế và kết quả.

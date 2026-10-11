# Playbook 2 — Phát triển một tính năng

**Dành cho developer:** dùng khi thêm, sửa hoặc cải thiện chức năng trong dự án đã có. Đọc hiểu code trước, mô tả Workflow thay đổi, rồi thiết kế kỹ thuật vừa đủ để triển khai. **Không thiết kế lại cả dự án.** Agent chỉ hỗ trợ trong phạm vi bạn giao.

Nếu bắt đầu với một ý tưởng chưa có dự án, xem [Playbook 1 — Bắt đầu từ con số 0](project-start-playbook.md).

## 6 bước thực hiện

### 1. Tìm hiểu chức năng hiện tại

- **Bạn làm:** Tìm màn hình/API, code và test liên quan; nếu tính năng dùng database, đọc **ERD và Relational Schema hiện tại** để hiểu dữ liệu.
- **Agent giúp:** Dẫn bạn đến đúng file và giải thích đường đi của dữ liệu.
- **Xong khi:** Bạn nói được chức năng hiện đang hoạt động ra sao, phần nào chịu trách nhiệm.

*Ví dụ:* Trước khi thêm Archive Conversation, hãy biết Conversation lưu ở bảng nào và API nào đang lấy danh sách.

### 2. Mô tả Workflow của tính năng

- **Bạn làm:** Ghi hoặc vẽ **người dùng thao tác → các bước hệ thống xử lý → kết quả**, kèm nhánh lỗi/quyền nếu cần.
- **Agent giúp:** Phát hiện bước còn thiếu và gợi ý cách kiểm tra.
- **Xong khi:** Bạn nhìn vào Workflow là biết chức năng phải hoạt động thế nào.

*Ví dụ — Archive Conversation:* Bấm Archive → kiểm tra quyền → đánh dấu archived → ẩn khỏi danh sách đang hoạt động. Không có quyền → từ chối, không thay đổi dữ liệu.

Workflow và vài ghi chú về kết quả mong đợi chính là **requirements** để code và test. Ghi ngắn gọn vào GitHub Issue; không cần spec riêng. Nếu phát sinh vai trò hoặc chức năng mới, cập nhật danh sách/Use Case của dự án **khi cần**.

### 3. Xem thay đổi ảnh hưởng những đâu

- **Bạn làm:** Kiểm tra có phải sửa UI, API, database, quyền truy cập hoặc xử lý nền không. Xác định chức năng cũ nào phải tiếp tục hoạt động.
- **Agent giúp:** Tìm chỗ gọi tới code đó và rủi ro bị ảnh hưởng.
- **Xong khi:** Bạn biết cần sửa những phần nào và cần giữ nguyên những gì.

*Ví dụ:* Archive có thể cần một cột trạng thái trong database, cập nhật API và lọc danh sách trên UI.

### 4. Chốt cách thực hiện

- **Bạn làm:** Dựa vào Workflow, xác định sẽ sửa code ở đâu, dữ liệu/API thay đổi gì và xử lý lỗi thế nào.
- **Nếu thay đổi database:** **Bắt buộc cập nhật cả ERD (thực thể/quan hệ) và Relational Schema (bảng/cột/PK/FK)** trước khi code. Nếu không thay đổi database, chỉ xem hai sơ đồ hiện có, không vẽ lại.
- **Agent giúp:** Đề xuất cách làm và kiểm tra hai sơ đồ có khớp với code, yêu cầu không.
- **Xong khi:** Bạn hiểu cách sửa, mô hình dữ liệu (nếu thay đổi) và cách kiểm tra kết quả.

**Sequence/State Diagram chỉ bổ sung khi thật sự cần**, không bắt buộc.

Nếu thay công nghệ/kiến trúc lớn, phải xét thêm tương thích dữ liệu cũ, cách chuyển đổi và cách quay lại trước khi code.

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

**Tôi hiểu code cũ chưa? Workflow mới chạy ra sao? Sửa phần nào? Kiểm tra thế nào?**

Nếu chưa rõ, yêu cầu agent **giải thích hoặc phân tích**, chưa yêu cầu code. Developer vẫn là người duyệt thiết kế và kết quả.

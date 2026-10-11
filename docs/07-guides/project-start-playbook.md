# Playbook 1 — Bắt đầu dự án từ con số 0

**Dành cho developer:** tự hiểu và quyết định trước khi giao agent hỗ trợ. Playbook này thiết kế **nền tảng chung của dự án**: Use Case → Requirements tổng quan → System Architecture → ERD + Relational Schema → kế hoạch. **Workflow kiến trúc từng chức năng thuộc [Playbook 2](feature-development-playbook.md)**, khi bắt đầu triển khai tính năng đó.

## 7 bước thực hiện

### 1. Viết rõ ý tưởng

- **Bạn làm:** Viết 2–3 câu: xây sản phẩm gì, ai dùng, giải quyết vấn đề nào.
- **Agent giúp:** Chỉ ra chỗ mô tả chưa rõ.
- **Xong khi:** Bạn giải thích được mục đích dự án mà không cần nói về công nghệ.

*Ví dụ:* Xây ứng dụng để người dùng upload PDF, đặt câu hỏi và nhận câu trả lời kèm nguồn trích dẫn.

### 2. Liệt kê chức năng — Use Case

- **Bạn làm:** Liệt kê các chức năng sẽ xây, ai được dùng và thứ tự triển khai.
- **Agent giúp:** Gợi ý chức năng có thể bị thiếu.
- **Xong khi:** Bạn biết hệ thống cần có những chức năng gì.

*Ví dụ:* Đăng nhập → upload PDF → hỏi đáp → xem trích dẫn → xem lịch sử.

**Use Case Diagram:** Có thể vẽ để thể hiện ai sử dụng chức năng nào. Nếu danh sách đã rõ, không cần vẽ.

**MVP:** Phiên bản chạy được đầu tiên với một số chức năng trong danh sách; các chức năng còn lại triển khai tiếp theo.

### 3. Ghi yêu cầu tổng quan (Requirements)

- **Bạn làm:** Ghi ngắn gọn từng chức năng phải đạt kết quả gì, các quy tắc hoặc lỗi quan trọng; chưa thiết kế luồng xử lý chi tiết.
- **Agent giúp:** Phát hiện yêu cầu chưa rõ để bạn bổ sung.
- **Xong khi:** Bạn có danh sách hành vi mong đợi làm cơ sở thiết kế hệ thống.

*Ví dụ — Upload PDF:* File hợp lệ được lưu; file sai định dạng bị từ chối; chỉ chủ sở hữu được xem tài liệu.

Không cần tài liệu Requirements riêng nếu vài dòng trong tài liệu dự án đã đủ rõ.

### 4. Thiết kế System Architecture

- **Bạn làm:** Vẽ sơ đồ kiến trúc tổng thể: các thành phần chính (frontend, backend, database, storage, dịch vụ ngoài nếu có), mỗi phần chịu trách nhiệm gì và kết nối thế nào.
- **Agent giúp:** Đề xuất cách chia trách nhiệm, giải thích các kết nối và điểm chưa hợp lý.
- **Xong khi:** Bạn giải thích được cấu trúc chung của hệ thống.

*Ví dụ:* Frontend ↔ Backend ↔ Database; Backend ↔ File Storage; Backend ↔ AI Service.

**Chưa cần vẽ Workflow của từng chức năng tại đây.**

### 5. Thiết kế database: ERD + Relational Schema

- **Bạn làm:** Từ Use Case, Requirements và System Architecture đã phân tích, xác định dữ liệu cần lưu rồi vẽ **cả hai sơ đồ**:
  - **ERD:** Các thực thể và quan hệ (ví dụ: User có nhiều Document).
  - **Relational Schema:** Các bảng, cột, khóa chính (PK), khóa ngoại (FK).
- **Agent giúp:** Đề xuất thực thể, quan hệ và bảng; bạn kiểm tra và chốt.
- **Xong khi:** Bạn hiểu dữ liệu được tổ chức thế nào và hai sơ đồ khớp nhau.

Nếu dự án không dùng database quan hệ, ghi rõ không áp dụng; không vẽ bảng giả. Các sơ đồ khác chỉ bổ sung khi cần.

### 6. Chọn công nghệ và lập kế hoạch

- **Bạn làm:** Chọn công nghệ cần dùng và giải thích ngắn lý do. Chia chức năng theo thứ tự phụ thuộc, ghi công việc vào GitHub Issues.
- **Agent giúp:** So sánh lựa chọn, đề xuất thứ tự công việc và những kiểm thử cần có.
- **Xong khi:** Có kiến trúc cơ bản, môi trường local chạy được và biết Issue đầu tiên cần làm gì.

*Ví dụ:* Chọn một luồng đầu tiên **upload một PDF → hỏi → nhận câu trả lời có trích dẫn**. Đừng làm xong toàn bộ frontend rồi mới bắt đầu backend.

**Chuẩn bị repository:** README cách chạy/test, `PROJECT-OVERVIEW.md` mô tả dự án, `AGENTS.md` hướng dẫn agent; tài liệu thiết kế quan trọng lưu trong `docs/`. Không tạo file chỉ để đủ mẫu.

### 7. Chuẩn bị repo và bắt đầu triển khai

- **Bạn làm:** Chuẩn bị repo, hướng dẫn chạy/test local và Issue đầu tiên. Sau đó dùng **[Playbook 2](feature-development-playbook.md)** để thiết kế Workflow kiến trúc và triển khai tính năng đầu tiên.
- **Agent giúp:** Hỗ trợ thiết lập môi trường, giải thích công việc và code trong phạm vi bạn cho phép.
- **Xong khi:** Repo sẵn sàng và bạn biết tính năng nào được triển khai đầu tiên.

Các tính năng tiếp theo cũng dùng Playbook 2. **Không phải vẽ trước Workflow chi tiết của mọi chức năng ở Playbook 1.**

## Trước khi chuyển sang code, tự hỏi

**Tôi biết cần xây gì? Kiến trúc chung gồm những phần nào? ERD và Relational Schema đã rõ chưa? Tính năng đầu tiên cần triển khai là gì?**

Nếu chưa trả lời được câu liên quan trực tiếp đến phần sắp code, quay lại bước tương ứng. **Developer quyết định; agent hỗ trợ.**

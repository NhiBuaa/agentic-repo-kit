# Playbook 1 — Bắt đầu dự án từ con số 0

**Dành cho developer:** tự hiểu và quyết định trước khi giao agent hỗ trợ. Playbook này thiết kế **nền tảng chung của dự án**: Use Case → Requirements tổng quan → System Architecture → ERD + Relational Schema → chọn công nghệ → chia phases triển khai. **Workflow kiến trúc từng chức năng thuộc [Playbook 2](feature-development-playbook.md)**, khi bắt đầu triển khai tính năng đó.

## 8 bước thực hiện

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

### 6. Chọn công nghệ

- **Bạn làm:** Dựa trên kiến trúc và dữ liệu đã thiết kế, chọn công nghệ cho frontend, backend, database và phần cần thiết khác; ghi ngắn gọn lý do chọn.
- **Agent giúp:** So sánh lựa chọn phù hợp với yêu cầu, độ phức tạp và khả năng triển khai.
- **Xong khi:** Bạn biết sẽ dùng công nghệ gì cho từng phần và giải thích được vì sao.

*Ví dụ:* Next.js cho giao diện, FastAPI cho API, PostgreSQL để lưu dữ liệu. Chỉ thêm dịch vụ khi có nhu cầu rõ ràng.

### 7. Lập kế hoạch theo phases triển khai

- **Bạn làm:** Nhóm các chức năng thành **Phase 1, Phase 2, ...** theo thứ tự phụ thuộc. Mỗi phase ghi rõ **mục tiêu, các chức năng sẽ xây và kết quả có thể chạy/kiểm tra**. Sau đó tạo GitHub Issues cho công việc trong từng phase.
- **Agent giúp:** Đề xuất thứ tự hợp lý, chỉ ra phụ thuộc và cách kiểm tra kết quả từng phase.
- **Xong khi:** Bạn biết mỗi phase cần hoàn thành gì và nên bắt đầu từ Issue nào.

*Ví dụ:* Phase 1 — Upload và quản lý PDF; Phase 2 — Hỏi đáp có trích dẫn; Phase 3 — Lịch sử hội thoại. Điều chỉnh thứ tự nếu có phụ thuộc kỹ thuật; tránh chia phase chỉ theo frontend/backend mà chưa có luồng chạy được.

### 8. Chuẩn bị repo và bắt đầu triển khai

- **Bạn làm:** Chuẩn bị repo, README hướng dẫn chạy/test local, `PROJECT-OVERVIEW.md` mô tả dự án và `AGENTS.md` hướng dẫn agent. Bắt đầu Issue đầu tiên của **Phase 1** bằng **[Playbook 2](feature-development-playbook.md)**.
- **Agent giúp:** Hỗ trợ thiết lập môi trường, giải thích công việc và code trong phạm vi bạn cho phép.
- **Xong khi:** Repo sẵn sàng, bạn biết Issue đầu tiên của Phase 1 và cách bắt đầu triển khai.

Các tính năng tiếp theo cũng dùng Playbook 2. **Không phải vẽ trước Workflow chi tiết của mọi chức năng ở Playbook 1.**

## Trước khi chuyển sang code, tự hỏi

**Tôi biết cần xây gì? Kiến trúc và database đã rõ chưa? Đã chọn công nghệ và chia phases hợp lý chưa? Tôi sẽ bắt đầu Issue nào?**

Nếu chưa trả lời được câu liên quan trực tiếp đến phần sắp code, quay lại bước tương ứng. **Developer quyết định; agent hỗ trợ.**

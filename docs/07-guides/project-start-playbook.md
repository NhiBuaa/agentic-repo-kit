# Playbook 1 — Bắt đầu dự án từ con số 0

**Dành cho developer:** tạo repo trước, rồi dùng repo để lưu và duyệt các quyết định: ý tưởng → Use Case → Requirements → System Architecture → ERD + Relational Schema → công nghệ → phases. **Workflow từng tính năng thuộc [Playbook 2](feature-development-playbook.md)**.

**Cách làm xuyên suốt:** Sau mỗi bước, khi bạn cho phép, agent ghi **bản nháp vào đúng nơi trong repo** và đưa diff/PR để developer **đọc → sửa → duyệt**. Chỉ dùng quyết định đã được duyệt làm cơ sở cho bước tiếp theo. Không tạo file trống hay sao chép cùng nội dung nhiều nơi.

## 8 bước thực hiện

### 1. Khởi tạo repository

- **Bạn làm:** Tạo GitHub repo, đặt tên và viết README mô tả tạm 1–2 dòng; dùng branch/PR để review các thay đổi. Chưa cần chốt stack hay dựng toàn bộ source code.
- **Agent giúp:** Đề xuất cấu trúc tối thiểu; chỉ tạo/sửa file khi được bạn cho phép.
- **Xong khi:** Repo sẵn sàng để lưu và review kết quả các bước tiếp theo.

**Ghi ở đâu?** `PROJECT-OVERVIEW.md` cho mục tiêu và quyết định nền tảng; `docs/` cho thiết kế ổn định; GitHub Issues/PRs cho công việc, thay đổi và review. Chỉ tạo tài liệu khi có nội dung.

### 2. Viết rõ ý tưởng

- **Bạn làm:** Viết 2–3 câu: xây sản phẩm gì, ai dùng, giải quyết vấn đề nào. Ghi vào `PROJECT-OVERVIEW.md` để review.
- **Agent giúp:** Chỉ ra chỗ mô tả chưa rõ.
- **Xong khi:** Bạn giải thích được mục đích dự án mà không cần nói về công nghệ.

*Ví dụ:* Xây ứng dụng để người dùng upload PDF, đặt câu hỏi và nhận câu trả lời kèm nguồn trích dẫn.

### 3. Liệt kê chức năng — Use Case

- **Bạn làm:** Liệt kê các chức năng sẽ xây và ai được dùng; lưu vào `docs/03-product/` khi cần. Thứ tự triển khai sẽ chốt ở bước chia phases.
- **Agent giúp:** Gợi ý chức năng có thể bị thiếu.
- **Xong khi:** Bạn biết hệ thống cần có những chức năng gì.

*Ví dụ:* Đăng nhập → upload PDF → hỏi đáp → xem trích dẫn → xem lịch sử.

**Use Case Diagram:** Có thể vẽ để thể hiện ai sử dụng chức năng nào. Nếu danh sách đã rõ, không cần vẽ.

**MVP:** Phiên bản chạy được đầu tiên với một số chức năng trong danh sách; các chức năng còn lại triển khai tiếp theo.

### 4. Ghi yêu cầu tổng quan (Requirements)

- **Bạn làm:** Ghi ngắn gọn chức năng phải đạt kết quả gì, quy tắc hoặc lỗi quan trọng; chưa thiết kế luồng xử lý chi tiết. Đưa bản nháp vào tài liệu phù hợp để review.
- **Agent giúp:** Phát hiện yêu cầu chưa rõ để bạn bổ sung.
- **Xong khi:** Bạn có danh sách hành vi mong đợi làm cơ sở thiết kế hệ thống.

*Ví dụ — Upload PDF:* File hợp lệ được lưu; file sai định dạng bị từ chối; chỉ chủ sở hữu được xem tài liệu.

Không cần tài liệu Requirements riêng nếu vài dòng trong tài liệu dự án đã đủ rõ.

### 5. Thiết kế System Architecture

- **Bạn làm:** Vẽ kiến trúc tổng thể: các thành phần (frontend, backend, database, storage, dịch vụ ngoài nếu có), trách nhiệm và kết nối. Đưa bản nháp vào `docs/02-architecture/` để review.
- **Agent giúp:** Đề xuất cách chia trách nhiệm, giải thích các kết nối và điểm chưa hợp lý.
- **Xong khi:** Bạn giải thích được cấu trúc chung của hệ thống.

*Ví dụ:* Frontend ↔ Backend ↔ Database; Backend ↔ File Storage; Backend ↔ AI Service.

**Chưa cần vẽ Workflow của từng chức năng tại đây.**

### 6. Thiết kế database: ERD + Relational Schema

- **Bạn làm:** Dựa trên Use Case, Requirements và System Architecture, xác định dữ liệu cần lưu rồi vẽ **cả hai sơ đồ** để review:
  - **ERD:** Các thực thể và quan hệ (ví dụ: User có nhiều Document).
  - **Relational Schema:** Các bảng, cột, khóa chính (PK), khóa ngoại (FK).
- **Agent giúp:** Đề xuất thực thể, quan hệ và bảng; bạn kiểm tra và chốt.
- **Xong khi:** Bạn hiểu dữ liệu được tổ chức thế nào và hai sơ đồ khớp nhau.

Nếu dự án không dùng database quan hệ, ghi rõ không áp dụng; không vẽ bảng giả. Các sơ đồ khác chỉ bổ sung khi cần.

### 7. Chọn công nghệ

- **Bạn làm:** Dựa trên kiến trúc và dữ liệu đã duyệt, chọn công nghệ cho frontend, backend, database và các phần cần thiết; ghi lựa chọn và lý do vào tài liệu dự án.
- **Agent giúp:** So sánh lựa chọn phù hợp với yêu cầu, độ phức tạp và khả năng triển khai.
- **Xong khi:** Bạn biết sẽ dùng công nghệ gì cho từng phần và giải thích được vì sao.

*Ví dụ:* Next.js cho giao diện, FastAPI cho API, PostgreSQL để lưu dữ liệu. Chỉ thêm dịch vụ khi có nhu cầu rõ ràng.

### 8. Lập kế hoạch theo phases triển khai

- **Bạn làm:** Nhóm chức năng thành **Phase 1, Phase 2, ...** theo thứ tự phụ thuộc. Mỗi phase ghi **mục tiêu, chức năng và kết quả chạy/kiểm tra được**. Tạo GitHub Issues cho công việc; developer review, chỉnh sửa và duyệt kế hoạch trước khi code.
- **Agent giúp:** Đề xuất thứ tự hợp lý, chỉ ra phụ thuộc và cách kiểm tra kết quả từng phase.
- **Xong khi:** Bạn biết mỗi phase cần hoàn thành gì và nên bắt đầu từ Issue nào.

*Ví dụ:* Phase 1 — Upload và quản lý PDF; Phase 2 — Hỏi đáp có trích dẫn; Phase 3 — Lịch sử hội thoại. Điều chỉnh thứ tự nếu có phụ thuộc kỹ thuật; tránh chia phase chỉ theo frontend/backend mà chưa có luồng chạy được.

Sau khi kế hoạch được duyệt, bắt đầu Issue đầu tiên của **Phase 1** bằng **[Playbook 2 — Phát triển tính năng](feature-development-playbook.md)**. Các tính năng khác cũng dùng Playbook 2; không vẽ trước Workflow chi tiết của tất cả chức năng.

## Trước khi chuyển sang code, tự hỏi

**Repo đã có các quyết định tôi review và duyệt chưa? Kiến trúc, database, công nghệ và phases đã rõ chưa? Tôi bắt đầu Issue nào?**

Nếu chưa trả lời được câu liên quan trực tiếp đến phần sắp code, quay lại bước tương ứng. **Developer quyết định; agent hỗ trợ.**

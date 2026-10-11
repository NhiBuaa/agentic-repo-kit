# Playbook 1 — Bắt đầu dự án từ con số 0

**Dành cho developer:** tự hiểu và quyết định trước khi giao agent hỗ trợ. **Use Case** cho biết hệ thống có chức năng gì; **Workflow kiến trúc** cho biết các thành phần hệ thống phối hợp xử lý thế nào. **ERD và Relational Schema bắt buộc khi thiết kế database.** Sơ đồ khác chỉ vẽ nếu cần.

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

### 3. Mô tả yêu cầu của chức năng

- **Bạn làm:** Với chức năng sắp triển khai, ghi ngắn gọn **người dùng cần gì → kết quả mong đợi → trường hợp lỗi/quyền quan trọng**.
- **Agent giúp:** Phát hiện yêu cầu chưa rõ và gợi ý cách kiểm thử.
- **Xong khi:** Bạn biết thế nào là chức năng chạy đúng.

*Ví dụ — Upload PDF:* Upload hợp lệ thì tài liệu xuất hiện; file sai định dạng thì báo lỗi; người khác không xem được tài liệu.

Đây là **Requirements (yêu cầu)**. Chỉ cần vài dòng rõ ràng, không bắt buộc có tài liệu riêng.

### 4. Vẽ Workflow kiến trúc hệ thống

- **Bạn làm:** Vẽ các thành phần chính như frontend, backend, database, storage, worker hoặc dịch vụ ngoài (nếu có), rồi nối mũi tên để thấy **thành phần nào gọi thành phần nào, dữ liệu đi đâu**.
- **Agent giúp:** Gợi ý cách chia trách nhiệm và kiểm tra đường đi dữ liệu.
- **Xong khi:** Bạn tự giải thích được toàn bộ hệ thống vận hành ở mức tổng quan.

*Ví dụ minh họa:* Frontend → Backend → Database; Backend → File Storage; Backend → AI Service.

**Đây là sơ đồ kiến trúc/luồng xử lý hệ thống, không phải sơ đồ người dùng bấm nút theo từng màn hình.**

### 5. Vẽ Workflow từng chức năng và thiết kế dữ liệu

- **Bạn làm:** Chọn chức năng sắp code, chỉ rõ **các thành phần trong Bước 4 phối hợp theo thứ tự nào**, dữ liệu đi qua đâu và lỗi được xử lý tại đâu.
- **Agent giúp:** Rà soát luồng giữa các thành phần và giải thích phần kỹ thuật chưa rõ.
- **Xong khi:** Bạn hiểu cách hệ thống sẽ thực hiện chức năng đó, trước khi code.

*Ví dụ — Upload PDF:* Frontend gửi file → Backend kiểm tra quyền/định dạng → File Storage lưu file → bộ xử lý đọc PDF → Database lưu kết quả/trạng thái.

**Nếu dùng database, bắt buộc có cả hai sơ đồ:**
- **ERD:** Các thực thể và quan hệ (ví dụ: User — Document).
- **Relational Schema:** Bảng, cột, khóa chính (PK), khóa ngoại (FK).

Nếu dự án không dùng database, ghi rõ không áp dụng. **Sequence/State Diagram và sơ đồ khác không bắt buộc.**

### 6. Chọn công nghệ và lập kế hoạch

- **Bạn làm:** Chọn công nghệ cần dùng và giải thích ngắn lý do. Chia chức năng theo thứ tự phụ thuộc, ghi công việc vào GitHub Issues.
- **Agent giúp:** So sánh lựa chọn, đề xuất thứ tự công việc và những kiểm thử cần có.
- **Xong khi:** Có kiến trúc cơ bản, môi trường local chạy được và biết Issue đầu tiên cần làm gì.

*Ví dụ:* Chọn một luồng đầu tiên **upload một PDF → hỏi → nhận câu trả lời có trích dẫn**. Đừng làm xong toàn bộ frontend rồi mới bắt đầu backend.

**Chuẩn bị repository:** README cách chạy/test, `PROJECT-OVERVIEW.md` mô tả dự án, `AGENTS.md` hướng dẫn agent; tài liệu thiết kế quan trọng lưu trong `docs/`. Không tạo file chỉ để đủ mẫu.

### 7. Code, kiểm thử và review

- **Bạn làm:** Triển khai từng Issue trên branch, chạy ứng dụng, thử chức năng đúng/lỗi và đọc diff trước khi duyệt PR.
- **Agent giúp:** Code, viết test, tìm lỗi, giải thích thay đổi. Chỉ sửa những gì bạn cho phép.
- **Xong khi:** Bạn **tự chạy và kiểm tra được** luồng đã xây, hiểu code chính và kết quả test.

Hoàn thành luồng đầu tiên rồi tiếp tục các chức năng đã liệt kê ở Bước 2. Từ đây, với từng chức năng mới, dùng [Playbook 2 — Phát triển tính năng](feature-development-playbook.md).

## Trước khi chuyển sang code, tự hỏi

**Tôi biết cần xây gì? Kết quả nào là đúng? Các thành phần hệ thống phối hợp ra sao? Dữ liệu được lưu thế nào? Tôi kiểm tra bằng cách nào?**

Nếu chưa trả lời được câu liên quan trực tiếp đến phần sắp code, quay lại bước tương ứng. **Developer quyết định; agent hỗ trợ.**

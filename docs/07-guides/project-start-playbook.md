# Playbook 1 — Bắt đầu dự án từ con số 0

**Dành cho developer:** tự hiểu và quyết định trước khi giao agent hỗ trợ. Ưu tiên **Use Case** (cần làm gì) và **Workflow** (hoạt động thế nào); **ERD và Relational Schema là hai sơ đồ dữ liệu cần chuẩn bị**. Các sơ đồ khác chỉ dùng nếu cần.

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

### 3. Vẽ Workflow — Chức năng hoạt động như thế nào?

- **Bạn làm:** Với mỗi chức năng sắp triển khai, mô tả **bắt đầu → các bước xử lý → kết quả**; thêm nhánh lỗi hoặc kiểm tra quyền nếu cần. Có thể vẽ Workflow Diagram hoặc viết các bước ngắn.
- **Agent giúp:** Kiểm tra luồng có thiếu bước, nhánh lỗi hay trường hợp đặc biệt không.
- **Xong khi:** Bạn nhìn luồng là biết chức năng phải chạy thế nào và kiểm tra đúng/sai ra sao.

*Ví dụ — Upload PDF:* Chọn PDF → kiểm tra file → hợp lệ thì lưu và hiển thị; không hợp lệ thì báo lỗi, không lưu.

**Requirements (yêu cầu)** chính là mô tả hành vi mong đợi như trên, cộng vài quy tắc cần thiết (ví dụ: không được xem tài liệu người khác). **Không phải tạo thêm một tài liệu riêng** nếu Workflow và ghi chú đã đủ rõ.

### 4. Phác thảo kiến trúc hệ thống

- **Bạn làm:** Xác định ứng dụng có những phần nào, mỗi phần phụ trách gì, chúng kết nối ra sao.
- **Agent giúp:** Đề xuất sơ đồ vài hộp và mũi tên, giải thích cách dữ liệu đi qua hệ thống.
- **Xong khi:** Bạn tự giải thích được đường đi từ thao tác người dùng đến kết quả.

*Ví dụ:* Người dùng → giao diện → backend → database; backend gọi AI model khi cần.


### 5. Thiết kế database và phần kỹ thuật

- **Bạn làm:** **Bắt buộc chuẩn bị cả ERD và Relational Schema** trước khi triển khai database:
  - **ERD:** Vẽ các thực thể và quan hệ (ví dụ: User có nhiều Document).
  - **Relational Schema:** Chuyển thành các bảng, cột, **khóa chính (PK)** và **khóa ngoại (FK)** (ví dụ: `Documents(id, user_id)`).
- **Agent giúp:** Gợi ý mô hình, kiểm tra quan hệ và các khóa; bạn duyệt trước khi code.
- **Xong khi:** Bạn hiểu dữ liệu được tổ chức thế nào và có thể dựa vào hai sơ đồ để tạo database.

Sau đó xác định ngắn gọn phần xử lý nghiệp vụ, API và lỗi quan trọng từ Workflow. **Sequence/State Diagram chỉ vẽ nếu thật sự cần.** Dự án không lưu dữ liệu thì ghi rõ hai sơ đồ không áp dụng, không vẽ dữ liệu giả.

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

**Tôi biết mình đang xây gì? Chức năng phải hoạt động thế nào? Hệ thống sẽ xử lý ra sao? Tôi sẽ kiểm tra bằng cách nào?**

Nếu chưa trả lời được câu liên quan trực tiếp đến phần sắp code, quay lại bước tương ứng. **Developer quyết định; agent hỗ trợ.**

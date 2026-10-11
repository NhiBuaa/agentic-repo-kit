# Playbook 1 — Bắt đầu dự án từ con số 0

**Dành cho developer:** làm theo từng bước, hiểu và chốt quyết định trước khi giao agent thực hiện. Agent giúp phân tích, giải thích, vẽ sơ đồ hoặc code; không tự quyết định thay bạn.

## 7 bước thực hiện

### 1. Viết rõ ý tưởng

- **Bạn làm:** Viết 2–3 câu: xây sản phẩm gì, ai dùng, giải quyết vấn đề nào.
- **Agent giúp:** Chỉ ra chỗ mô tả chưa rõ.
- **Xong khi:** Bạn giải thích được mục đích dự án mà không cần nói về công nghệ.

*Ví dụ:* Xây ứng dụng để người dùng upload PDF, đặt câu hỏi và nhận câu trả lời kèm nguồn trích dẫn.

### 2. Liệt kê chức năng và người dùng

- **Bạn làm:** Liệt kê **tất cả chức năng dự định xây**, ai sử dụng từng chức năng, rồi sắp xếp **thứ tự triển khai**.
- **Agent giúp:** Gợi ý chức năng hoặc tình huống bạn có thể đã bỏ sót.
- **Xong khi:** Có danh sách chức năng và biết sẽ xây cái nào trước.

*Ví dụ:* Đăng nhập → upload PDF → hỏi đáp → xem trích dẫn → quản lý lịch sử.

**Use Case Diagram:** Vẽ nếu muốn nhìn trực quan *ai làm được chức năng nào*. Không bắt buộc nếu danh sách đã rõ.

**MVP là gì?** Là **phiên bản chạy được đầu tiên**, gồm một số chức năng trong danh sách. Các chức năng còn lại **vẫn sẽ làm**, chỉ được triển khai sau. Không cần chia thành “làm ngay / để sau / không làm”.

### 3. Mô tả cách từng chức năng hoạt động (Requirements)

**Tại sao cần bước này?** Để bạn và agent thống nhất **thế nào là làm đúng**, tránh code ra chức năng khác với ý bạn.

- **Bạn làm:** Với mỗi chức năng, ghi ngắn gọn: **người dùng làm gì → hệ thống phản hồi gì → lỗi thì sao**. Thêm quy tắc quan trọng về quyền hoặc dữ liệu nếu có.
- **Agent giúp:** Biến mô tả thành ví dụ kiểm thử, hỏi những trường hợp chưa rõ.
- **Xong khi:** Đọc mô tả là biết cách thử chức năng đúng hay sai.

*Ví dụ — Upload PDF:*
- Người dùng chọn file PDF và bấm Upload → tài liệu xuất hiện trong danh sách.
- Chọn file không hợp lệ → hiển thị lỗi, không tạo tài liệu.
- Người dùng không được xem tài liệu của người khác.

Đó chính là **requirements (yêu cầu chức năng)**; không cần viết tài liệu dài hoặc dùng từ ngữ phức tạp.

### 4. Phác thảo kiến trúc hệ thống

- **Bạn làm:** Xác định ứng dụng có những phần nào, mỗi phần phụ trách gì, chúng kết nối ra sao.
- **Agent giúp:** Đề xuất sơ đồ vài hộp và mũi tên, giải thích cách dữ liệu đi qua hệ thống.
- **Xong khi:** Bạn tự giải thích được đường đi từ thao tác người dùng đến kết quả.

*Ví dụ:* Người dùng → giao diện → backend → database; backend gọi AI model khi cần.


### 5. Thiết kế dữ liệu và luồng quan trọng

- **Bạn làm:** Xác định dữ liệu nào cần lưu, các đối tượng liên hệ thế nào và một chức năng quan trọng chạy theo thứ tự nào.
- **Agent giúp:** Vẽ sơ đồ cần thiết, giải thích mỗi thành phần và phát hiện thiếu sót.
- **Xong khi:** Bạn hiểu dữ liệu nằm đâu, một thao tác được xử lý ra sao và có lỗi thì thế nào.

| Bạn cần làm rõ | Sơ đồ nên dùng |
| --- | --- |
| Các đối tượng dữ liệu liên hệ thế nào? | **ERD / Domain Model** |
| Các thành phần gọi nhau theo thứ tự nào? | **Sequence Diagram** |
| Upload/job có trạng thái xử lý, thất bại, thử lại? | **State Machine** |
| Quy trình nghiệp vụ có nhiều nhánh? | **Activity Diagram** |
| Module trong một service quá phức tạp? | **Component Diagram** |
| Ứng dụng chạy trên máy/container nào? | **Deployment Diagram** |

**Không phải vẽ tất cả.** Chỉ chọn sơ đồ giúp bạn hiểu một điều chưa rõ.

### 6. Chọn công nghệ và lập kế hoạch

- **Bạn làm:** Chọn công nghệ phù hợp cho từng phần, nói được lý do. Chia danh sách chức năng thành các nhóm triển khai theo thứ tự phụ thuộc; tạo GitHub Issues tương ứng.
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

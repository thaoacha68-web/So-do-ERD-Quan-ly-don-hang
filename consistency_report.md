# BAO CAO PHAN TICH PHAN VENG NG HIEP VU (GAP ANALYSIS REPORT)

## 1. Su dung kieu du lieu Boolean sai muc dich
Thiet ke cu dung `is_active BOOLEAN` chi bieu dien duoc 2 trang thai (True/False). Nghiép vu HealthSync yeu cau vong doi lich hen qua 5 trang thai: `PENDING` -> `CONFIRMED` -> `CHECKED_IN` -> `COMPLETED` / `CANCELLED`. Viec thay the sang kiểu `ENUM` giup kiem soat chinh xac vong doi va ngan nghech cac trang thai hop le.

## 2. Thieu cac truong du lieu quan ly tai chinh va phat huy
Co so du lieu cu hoan toan thieu `deposit_amount`, `penalty_fee` va `cancel_reason`. Khi benh nhan huy lich, he thong khong the ghi nhan ly do hay tinh toan phi phat tru vao tien coc, gay that thoát va sai lech trong doi soat ke toan.

## 3. Vang mat bang Don thuoc (Prescriptions)
Quy trinh nghiep vu quy dinh khi kham xong (`COMPLETED`), bac si phai ke don thuoc. Database cu khong co bang `Prescriptions` va lien ket khoa ngoai voi `Appointments`, khien he thong khong the luu truc thong tin don thuoc cua benh nhan.

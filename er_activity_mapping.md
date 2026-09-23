# BAO CAO PHAN TICH ANH XA ERD VA ACTIVITY DIAGRAM (AUTORIDE)

## 1. Ly do cot damage_fee va late_fee la bat buoc
Trong quy trinh tra xe của AutoRide, hai nhanh re nghiep vu quan trong nhat la "Khach tra tre" va "Xe bi hu hong". Thiet ke cu thieu `late_fee` va `damage_fee` khien he thong khong the ghi nhan cac khoan phi phat, buoc nhan vien phai hoan lai 100% tien coc. Viec bo sung cac cot kieu `DECIMAL(10,2)` giup dam bao tinh toan chinh xac dong tien refund (= deposit - late_fee - damage_fee), bao ve loi nhuan va dam bao tinh toan ven tai chinh cho ke toan.

## 2. Vai tro cua bang Inspections
Tach rieng bang `Inspections` giup ghi lai chi tiet tinh trang xe (vitri tray xuoc, nguoi kiem tra, thoi gian) theo quan he 1-N/1-1. Dieu nay tranh viec phat sinh nhieu chuoi TEXT dai trong bang `Rentals` va ho tro truy xuat lich su hu hong cua xe qua nhieu lan thue.

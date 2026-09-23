# NHAT KY TUONG TAC AI (AI PROMPT LOG)

## Prompt 1: Tim hieu kieu ENUM va Anti-pattern
- **Prompt:** "Trong MySQL, tai sao dung is_active BOOLEAN de theo doi quy trinh nhieu buoc lai la anti-pattern? Nen thay the bang gi?"
- **Ket qua:** AI phan tich han che cua BOOLEAN va de xuat dung `ENUM` hoac bang tra cuu trang thai (`Status Lookup Table`).

## Prompt 2: Kieu du lieu tai chinh
- **Prompt:** "Khi luu tru deposit_amount va penalty_fee trong MySQL, nen dung FLOAT hay DECIMAL? Tai sao?"
- **Ket qua:** AI khuyen dung `DECIMAL(10,2)` de tranh sai so lam tron (precision error) cua kieu so thuc FLOAT/DOUBLE khi tinh toan tien te.

## Prompt 3: Thiet ke quan he 1-1
- **Prompt:** "Lam sao de thiet lap quan he 1-1 giua bang Appointments va Prescriptions trong MySQL?"
- **Ket qua:** AI huong dan them ràng buộc `UNIQUE` vao khoá ngoai `appointment_id` trong bang `Prescriptions`.

## Prompt 4: Thiet ke CSDL thue xe AutoRide
- **Prompt:** "Tai sao nen dung DECIMAL(10,2) cho cac cot tai chinh security_deposit, damage_fee trong MySQL va loi ich cua viec tach bang Inspections?"
- **Ket qua:** AI phan tich nguy co sai so cua FLOAT, dong thoi khuyen nghi tach bang Inspections de chuan hoa du lieu va luu vet bien ban kiem tra xe.

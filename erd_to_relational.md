# CHUYEN DOI ERD SANG MO HINH QUAN HE

## Danh sach cac bang du lieu sau chuyen doi:
1. **DON_VI_KHACH** (MaDV [PK], TenDV, DiaChi, DienThoai)
2. **NGUOI_DAT** (MaND [PK], HoTenND, MaDV [FK])
3. **NGUOI_NHAN** (MaNN [PK], HoTenNN, MaDV [FK])
4. **NGUOI_GIAO** (MaNG [PK], HoTenNG)
5. **NOI_GIAO** (MaDDG [PK], TenNoiGiao)
6. **DON_DAT_HANG** (SoDH [PK], NgayDat, MaND [FK])
7. **PHIEU_GIAO_HANG** (SoPG [PK], NgayGiao, SoDH [FK], MaDDG [FK], MaNG [FK], MaNN [FK])
8. **HANG** (MaHang [PK], TenHang, DonViTinh, MoTa)
9. **CHI_TIET_DAT** (SoDH [PK, FK], MaHang [PK, FK], SoLuongDat)
10. **CHI_TIET_GIAO** (SoPG [PK, FK], MaHang [PK, FK], SoLuongGiao, DonGiaGiao)

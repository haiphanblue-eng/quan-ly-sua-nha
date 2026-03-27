-- Chạy file này trong Supabase Dashboard > SQL Editor

CREATE TABLE cong_viec (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  khu_vuc text NOT NULL,
  hang_muc text NOT NULL,
  mo_ta text,
  trao_doi text DEFAULT 'Chưa trao đổi' CHECK (trao_doi IN ('Chưa trao đổi', 'Đã trao đổi', 'Không cần')),
  ngay_trao_doi date,
  tien_do text DEFAULT 'Chưa làm' CHECK (tien_do IN ('Chưa làm', 'Đang làm', 'Hoàn thành')),
  ngay_hoan_thanh date,
  nha_thau text,
  chi_phi_du_kien bigint DEFAULT 0,
  chi_phi_thuc_te bigint DEFAULT 0,
  ghi_chu text,
  thu_tu integer,
  created_at timestamptz DEFAULT now()
);

-- Cho phép truy cập không cần đăng nhập (public read/write)
ALTER TABLE cong_viec ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public access" ON cong_viec FOR ALL USING (true) WITH CHECK (true);

-- Dữ liệu mẫu
INSERT INTO cong_viec (khu_vuc, hang_muc, mo_ta, chi_phi_du_kien, thu_tu) VALUES
('WC', 'Đục khoét lỗ thoát nước', 'Đục lỗ sàn cho thoát nước mới', 500000, 1),
('WC', 'Chống thấm sàn', 'Quét 2 lớp chống thấm, thử nước 24h', 1500000, 2),
('WC', 'Ốp gạch sàn & tường', 'Gạch 60x60, tường cao 2.2m', 8000000, 3),
('WC', 'Lắp đặt thiết bị vệ sinh', 'Bồn cầu, lavabo, vòi sen', 5000000, 4),
('WC', 'Hệ thống điện trong WC', 'Ổ cắm, đèn, quạt thông gió', 1200000, 5),
('Bếp', 'Đường ống cấp/thoát nước', 'Đặt lại đường ống cho bồn rửa', 2000000, 6),
('Bếp', 'Hệ thống điện bếp', 'Ổ cắm riêng cho bếp từ, lò vi sóng, tủ lạnh', 1500000, 7),
('Bếp', 'Ốp gạch backsplash', 'Gạch ốp tường bếp sau bếp nấu', 2500000, 8),
('Bếp', 'Lắp tủ bếp', 'Tủ bếp trên + dưới, mặt đá granite', 25000000, 9),
('Phòng ngủ', 'Sơn tường', 'Cạo vôi cũ, bả matit, sơn 2 lớp', 4000000, 10),
('Phòng ngủ', 'Sàn gỗ / sàn nhựa', 'Lát sàn gỗ công nghiệp 12mm', 12000000, 11),
('Phòng ngủ', 'Trần thạch cao', 'Trần phẳng, có đèn âm trần', 6000000, 12),
('Phòng ngủ', 'Hệ thống điện & đèn', 'Đèn trần, đèn đọc sách, ổ cắm', 2000000, 13),
('Chung', 'Điện tổng / bảng điện', 'Kiểm tra & nâng cấp cầu dao, tủ điện', 3000000, 14),
('Chung', 'Đường ống nước tổng', 'Thay ống nước cũ, kiểm tra rò rỉ', 4000000, 15),
('Chung', 'Sơn tường hành lang / phòng khách', 'Cạo vôi cũ, bả matit, sơn 2 lớp', 6000000, 16),
('Chung', 'Dọn dẹp & vệ sinh sau thi công', 'Vệ sinh toàn bộ sau khi xong', 500000, 17);

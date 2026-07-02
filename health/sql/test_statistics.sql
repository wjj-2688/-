-- 统计报表测试数据
INSERT INTO t_statistics_report (report_name, report_type, start_date, end_date, generate_time, data_json, total_count, status, remark, create_by, create_time) VALUES
('2026年6月体检统计月报', 'physical', '2026-06-01', '2026-06-30', NOW(), '{"total":156,"male":82,"female":74,"byType":{"入职体检":89,"年度体检":67}}', 156, '1', '6月度体检汇总', 'admin', NOW()),
('2026年Q2药品使用统计', 'drug', '2026-04-01', '2026-06-30', NOW(), '{"total":320,"topCats":{"抗生素":85,"降糖药":62,"降压药":58,"感冒药":45}}', 320, '1', '二季度药品使用情况', 'admin', NOW()),
('2026年6月预约挂号统计', 'reservation', '2026-06-01', '2026-06-30', NOW(), '{"total":432,"completed":389,"cancelRate":0.099,"topDepts":{"内科":120,"外科":95,"儿科":78,"妇科":72,"骨科":67}}', 432, '1', '6月预约统计', 'admin', NOW()),
('2026年上半年收入统计', 'revenue', '2026-01-01', '2026-06-30', NOW(), '{"totalRevenue":2850000,"examRevenue":1280000,"drugRevenue":960000,"regRevenue":610000}', 2850000, '1', '上半年收入汇总', 'admin', NOW()),
('2026年7月体检周报', 'physical', '2026-07-01', '2026-07-07', NOW(), '{"total":12,"male":6,"female":6,"avgAge":36.5}', 12, '0', '7月第一周数据待完善', 'admin', NOW());
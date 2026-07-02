-- ----------------------------
-- 体检报告管理菜单
-- ----------------------------
-- 一级目录
insert into sys_menu values('3000', '体检报告管理', '0', '5', 'report', null, '', '', 1, 0, 'M', '0', '0', '', 'documentation', 'admin', sysdate(), '', null, '体检报告管理目录');

-- 体检报告菜单
insert into sys_menu values('3001', '体检报告', '3000', '1', 'physicalReport', 'report/physicalReport/index', '', '', 1, 0, 'C', '0', '0', 'report:physical:list', 'list', 'admin', sysdate(), '', null, '体检报告菜单');

-- 按钮权限
insert into sys_menu values('3002', '体检报告查询', '3001', '1', '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:query', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('3003', '体检报告新增', '3001', '2', '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:add', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('3004', '体检报告修改', '3001', '3', '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:edit', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('3005', '体检报告删除', '3001', '4', '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:remove', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('3006', '体检报告导出', '3001', '5', '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:export', '#', 'admin', sysdate(), '', null, '');

-- ----------------------------
-- 统计报表管理菜单
-- ----------------------------
-- 一级目录
insert into sys_menu values('3010', '统计报表管理', '0', '6', 'statistics', null, '', '', 1, 0, 'M', '0', '0', '', 'chart', 'admin', sysdate(), '', null, '统计报表管理目录');

-- 统计报表菜单
insert into sys_menu values('3011', '统计报表', '3010', '1', 'statisticsReport', 'statistics/statisticsReport/index', '', '', 1, 0, 'C', '0', '0', 'statistics:report:list', 'table', 'admin', sysdate(), '', null, '统计报表菜单');

-- 按钮权限
insert into sys_menu values('3012', '统计报表查询', '3011', '1', '', '', '', '', 1, 0, 'F', '0', '0', 'statistics:report:query', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('3013', '统计报表新增', '3011', '2', '', '', '', '', 1, 0, 'F', '0', '0', 'statistics:report:add', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('3014', '统计报表修改', '3011', '3', '', '', '', '', 1, 0, 'F', '0', '0', 'statistics:report:edit', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('3015', '统计报表删除', '3011', '4', '', '', '', '', 1, 0, 'F', '0', '0', 'statistics:report:remove', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('3016', '统计报表导出', '3011', '5', '', '', '', '', 1, 0, 'F', '0', '0', 'statistics:report:export', '#', 'admin', sysdate(), '', null, '');

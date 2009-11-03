DROP VIEW IF EXISTS `pxxt_shenzhen`.`jifentongji`;
CREATE ALGORITHM=UNDEFINED DEFINER=`pxxt_shenzhen`@`%` SQL SECURITY DEFINER VIEW  `pxxt_shenzhen`.`jifentongji` AS select `a`.`USERNAME` AS `username`,`b`.`GROUPNAME` AS `groupname`,sum((case when (`c`.`learnmode` = _utf8'现场培训') then `c`.`pxxf` else 0 end)) AS `xianchang`,sum((case when (`c`.`learnmode` = _utf8'在线视频') then `c`.`pxxf` else 0 end)) AS `video`,sum((case when (`c`.`learnmode` = _utf8'文本课件') then `c`.`pxxf` else 0 end)) AS `doc`,sum((case when (`c`.`learnmode` = _utf8'积分补登') then `c`.`pxxf` else 0 end)) AS `budeng`,sum((case when (`c`.`learnmode` = _utf8'未到扣分') then `c`.`pxxf` else 0 end)) AS `koufen`,sum(`c`.`pxxf`) AS `zongjifen` from ((`sys_user` `a` join `sys_group` `b` on((`a`.`GROUPID` = `b`.`GROUPID`))) join `lawyerlessonxf` `c` on((`a`.`USERID` = `c`.`userid`))) group by `a`.`USERNAME`,`b`.`GROUPNAME`;

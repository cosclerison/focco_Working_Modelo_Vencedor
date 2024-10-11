DECLARE v_tblocos_cab_din_id   tblocos_cab_dinamico.id%TYPE; v_tdecode_campos_id    tdecode_campos_cab_din.id%TYPE; v_tlink_blocos_id      tlink_blocos_cab_dinamico.id%TYPE; vCabDinId              tcab_dinamico.id%TYPE; vColDinId              tcampos_cab_dinamico.id%TYPE; vTabDinOriId           tblocos_cab_dinamico.id%TYPE; vTabDinDesId           tblocos_cab_dinamico.id%TYPE;BEGIN  SELECT seq_id_tcab_dinamico.nextval   INTO vCabDinId   FROM dual;
INSERT INTO tcab_dinamico(id,descricao,col_pk_id,col_fk_id,tipo_rel,ordem_rel,cab_din_pai_id,tipo_txt,align_car,car_align_car,separador,separador_alt,sep_esq,sep_dir,mascara_data,sep_campos,decimais,qtde_registros,total_geral,regra,sel_dinamica_pes,quebras_do_lado,tem_distinct
                                          ,foccomail ) VALUES(vCabDinId,'Relatório de Custos Industriais de Materiais e MOT - MV',NULL,NULL,'',NULL,NULL,'L','E','','','','','','','',NULL,NULL,0,0,0,0,0,<FOCCOMAIL> );
 SELECT seq_id_tblocos_cab_dinamico.nextval INTO v_tblocos_cab_din_id FROM dual;
INSERT INTO tblocos_cab_dinamico(id,
                                                  cab_din_id,
                                                  bloco,
                                                  tabela) VALUES(v_tblocos_cab_din_id,vCabDinId,'TEMPRESAS','TEMPRESAS');
 SELECT seq_id_tblocos_cab_dinamico.nextval INTO v_tblocos_cab_din_id FROM dual;
INSERT INTO tblocos_cab_dinamico(id,
                                                  cab_din_id,
                                                  bloco,
                                                  tabela) VALUES(v_tblocos_cab_din_id,vCabDinId,'TITENS_EMPR','TITENS_EMPR');
 SELECT seq_id_tblocos_cab_dinamico.nextval INTO v_tblocos_cab_din_id FROM dual;
INSERT INTO tblocos_cab_dinamico(id,
                                                  cab_din_id,
                                                  bloco,
                                                  tabela) VALUES(v_tblocos_cab_din_id,vCabDinId,'TITENS','TITENS');
 SELECT seq_id_tblocos_cab_dinamico.nextval INTO v_tblocos_cab_din_id FROM dual;
INSERT INTO tblocos_cab_dinamico(id,
                                                  cab_din_id,
                                                  bloco,
                                                  tabela) VALUES(v_tblocos_cab_din_id,vCabDinId,'TITENS_CUSTOS','TITENS_CUSTOS');
 SELECT seq_id_tblocos_cab_dinamico.nextval INTO v_tblocos_cab_din_id FROM dual;
INSERT INTO tblocos_cab_dinamico(id,
                                                  cab_din_id,
                                                  bloco,
                                                  tabela) VALUES(v_tblocos_cab_din_id,vCabDinId,'TMASC_ITEM','TMASC_ITEM');
 SELECT seq_id_tblocos_cab_dinamico.nextval INTO v_tblocos_cab_din_id FROM dual;
INSERT INTO tblocos_cab_dinamico(id,
                                                  cab_din_id,
                                                  bloco,
                                                  tabela) VALUES(v_tblocos_cab_din_id,vCabDinId,'TITENS_CUSTOS_CONF','TITENS_CUSTOS_CONF');
 SELECT seq_id_tcampos_cab_dinamico.nextval INTO vColDinId FROM dual;
INSERT INTO tcampos_cab_dinamico(id,campo,linha,coluna,largura,separador,decimais,datatype,restricao,formula,cab_din_id,descricao,quebra,ordem,tipo,mascara,alinhamento,exibe_totais,ordem_sql,ordem_grafico,aceita_restricao,restricao2,restricao_job,separador_alt,align_car,car_align_car,mascara_data,sep_esq,sep_dir,acumulador,fonte_nome,fonte_tamanho,fonte_cor,fonte_negrito,fonte_sublinhado,fonte_italico,fonte_riscado,formato) VALUES (vColDinId,'TEMPRESAS.COD_EMP',1,NULL,4,'',0,'VARCHAR2','','NONE',vCabDinId,'Empresa',NULL,NULL,'V','','',0,1,NULL,1,'1','','','E','','','','',0,'Courier New',10,'#000000',0,0,0,0,'G');
 SELECT seq_id_tcampos_cab_dinamico.nextval INTO vColDinId FROM dual;
INSERT INTO tcampos_cab_dinamico(id,campo,linha,coluna,largura,separador,decimais,datatype,restricao,formula,cab_din_id,descricao,quebra,ordem,tipo,mascara,alinhamento,exibe_totais,ordem_sql,ordem_grafico,aceita_restricao,restricao2,restricao_job,separador_alt,align_car,car_align_car,mascara_data,sep_esq,sep_dir,acumulador,fonte_nome,fonte_tamanho,fonte_cor,fonte_negrito,fonte_sublinhado,fonte_italico,fonte_riscado,formato) VALUES (vColDinId,'TITENS.COD_ITEM',1,NULL,15,'',NULL,'NUMBER','','NONE',vCabDinId,'Cod Item',NULL,NULL,'V','','',0,2,NULL,1,'20100045,10020003','','','E','','','','',0,'Courier New',10,'#000000',0,0,0,0,'G');
 SELECT seq_id_tcampos_cab_dinamico.nextval INTO vColDinId FROM dual;
INSERT INTO tcampos_cab_dinamico(id,campo,linha,coluna,largura,separador,decimais,datatype,restricao,formula,cab_din_id,descricao,quebra,ordem,tipo,mascara,alinhamento,exibe_totais,ordem_sql,ordem_grafico,aceita_restricao,restricao2,restricao_job,separador_alt,align_car,car_align_car,mascara_data,sep_esq,sep_dir,acumulador,fonte_nome,fonte_tamanho,fonte_cor,fonte_negrito,fonte_sublinhado,fonte_italico,fonte_riscado,formato) VALUES (vColDinId,'TITENS.DESC_TECNICA',1,NULL,70,'',NULL,'VARCHAR2','','NONE',vCabDinId,'Item',NULL,NULL,'V','','',0,3,NULL,0,'','','','E','','','','',0,'Courier New',10,'#000000',0,0,0,0,'G');
 SELECT seq_id_tcampos_cab_dinamico.nextval INTO vColDinId FROM dual;
INSERT INTO tcampos_cab_dinamico(id,campo,linha,coluna,largura,separador,decimais,datatype,restricao,formula,cab_din_id,descricao,quebra,ordem,tipo,mascara,alinhamento,exibe_totais,ordem_sql,ordem_grafico,aceita_restricao,restricao2,restricao_job,separador_alt,align_car,car_align_car,mascara_data,sep_esq,sep_dir,acumulador,fonte_nome,fonte_tamanho,fonte_cor,fonte_negrito,fonte_sublinhado,fonte_italico,fonte_riscado,formato) VALUES (vColDinId,'TMASC_ITEM.ID',1,NULL,10,'',0,'NUMBER','','NONE',vCabDinId,'ID',NULL,NULL,'V','','',0,4,NULL,1,'','','','E','','','','',0,'Courier New',10,'#000000',0,0,0,0,'G');
 SELECT seq_id_tcampos_cab_dinamico.nextval INTO vColDinId FROM dual;
INSERT INTO tcampos_cab_dinamico(id,campo,linha,coluna,largura,separador,decimais,datatype,restricao,formula,cab_din_id,descricao,quebra,ordem,tipo,mascara,alinhamento,exibe_totais,ordem_sql,ordem_grafico,aceita_restricao,restricao2,restricao_job,separador_alt,align_car,car_align_car,mascara_data,sep_esq,sep_dir,acumulador,fonte_nome,fonte_tamanho,fonte_cor,fonte_negrito,fonte_sublinhado,fonte_italico,fonte_riscado,formato) VALUES (vColDinId,'TMASC_ITEM.MASCARA',1,NULL,70,'',NULL,'VARCHAR2','','NONE',vCabDinId,'Mascara',NULL,NULL,'V','','',0,5,NULL,0,'','','','E','','','','',0,'Courier New',10,'#000000',0,0,0,0,'G');
 SELECT seq_id_tcampos_cab_dinamico.nextval INTO vColDinId FROM dual;
INSERT INTO tcampos_cab_dinamico(id,campo,linha,coluna,largura,separador,decimais,datatype,restricao,formula,cab_din_id,descricao,quebra,ordem,tipo,mascara,alinhamento,exibe_totais,ordem_sql,ordem_grafico,aceita_restricao,restricao2,restricao_job,separador_alt,align_car,car_align_car,mascara_data,sep_esq,sep_dir,acumulador,fonte_nome,fonte_tamanho,fonte_cor,fonte_negrito,fonte_sublinhado,fonte_italico,fonte_riscado,formato) VALUES (vColDinId,'CASE WHEN TMASC_ITEM.ID IS NOT NULL THEN NVL(TITENS_CUSTOS_CONF.VLR_CST_MAT_DIR,TITENS_CUSTOS_CONF.VLR_CST_MAT_INT) ELSE NVL(TITENS_CUSTOS.VLR_CST_MAT_DIR,TITENS_CUSTOS.VLR_CST_MAT_INT) END',1,NULL,10,'',8,'NUMBER','','NONE',vCabDinId,'Materiais',NULL,NULL,'V','FM999G999G990D9990','D',0,6,NULL,0,'','','','E','','','','',0,'Courier New',10,'#000000',0,0,0,0,'G');
 SELECT seq_id_tcampos_cab_dinamico.nextval INTO vColDinId FROM dual;
INSERT INTO tcampos_cab_dinamico(id,campo,linha,coluna,largura,separador,decimais,datatype,restricao,formula,cab_din_id,descricao,quebra,ordem,tipo,mascara,alinhamento,exibe_totais,ordem_sql,ordem_grafico,aceita_restricao,restricao2,restricao_job,separador_alt,align_car,car_align_car,mascara_data,sep_esq,sep_dir,acumulador,fonte_nome,fonte_tamanho,fonte_cor,fonte_negrito,fonte_sublinhado,fonte_italico,fonte_riscado,formato) VALUES (vColDinId,'CASE WHEN TMASC_ITEM.ID IS NOT NULL THEN TITENS_CUSTOS_CONF.VLR_CST_MO_TERC ELSE TITENS_CUSTOS.VLR_CST_MO_TERC END',1,NULL,10,'',8,'NUMBER','','NONE',vCabDinId,'MOT',NULL,NULL,'V','FM999G999G990D9990','D',0,7,NULL,0,'','','','E','','','','',0,'Courier New',10,'#000000',0,0,0,0,'G');
 SELECT ID   INTO vTabDinOriId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TITENS'    AND bloco = 'TITENS'    AND cab_din_id = vCabDinId; SELECT ID   INTO vTabDinDesId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TITENS_EMPR'    AND bloco = 'TITENS_EMPR'    AND cab_din_id = vCabDinId; SELECT seq_id_tlink_blocos_cab_din.nextval INTO v_tlink_blocos_id FROM dual;
 INSERT INTO tlink_blocos_cab_dinamico(id,bloco_origem_id,coluna_origem,bloco_destino_id,coluna_destino,outer_origem,outer_destino) VALUES (v_tlink_blocos_id,vTabDinOriId,'ID',vTabDinDesId,'ITEM_ID',0,0);
 SELECT ID   INTO vTabDinOriId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TEMPRESAS'    AND bloco = 'TEMPRESAS'    AND cab_din_id = vCabDinId; SELECT ID   INTO vTabDinDesId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TITENS_EMPR'    AND bloco = 'TITENS_EMPR'    AND cab_din_id = vCabDinId; SELECT seq_id_tlink_blocos_cab_din.nextval INTO v_tlink_blocos_id FROM dual;
 INSERT INTO tlink_blocos_cab_dinamico(id,bloco_origem_id,coluna_origem,bloco_destino_id,coluna_destino,outer_origem,outer_destino) VALUES (v_tlink_blocos_id,vTabDinOriId,'ID',vTabDinDesId,'EMPR_ID',0,0);
 SELECT ID   INTO vTabDinOriId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TITENS_EMPR'    AND bloco = 'TITENS_EMPR'    AND cab_din_id = vCabDinId; SELECT ID   INTO vTabDinDesId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TITENS_CUSTOS'    AND bloco = 'TITENS_CUSTOS'    AND cab_din_id = vCabDinId; SELECT seq_id_tlink_blocos_cab_din.nextval INTO v_tlink_blocos_id FROM dual;
 INSERT INTO tlink_blocos_cab_dinamico(id,bloco_origem_id,coluna_origem,bloco_destino_id,coluna_destino,outer_origem,outer_destino) VALUES (v_tlink_blocos_id,vTabDinOriId,'ID',vTabDinDesId,'ITEMPR_ID',0,0);
 SELECT ID   INTO vTabDinOriId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TITENS_EMPR'    AND bloco = 'TITENS_EMPR'    AND cab_din_id = vCabDinId; SELECT ID   INTO vTabDinDesId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TMASC_ITEM'    AND bloco = 'TMASC_ITEM'    AND cab_din_id = vCabDinId; SELECT seq_id_tlink_blocos_cab_din.nextval INTO v_tlink_blocos_id FROM dual;
 INSERT INTO tlink_blocos_cab_dinamico(id,bloco_origem_id,coluna_origem,bloco_destino_id,coluna_destino,outer_origem,outer_destino) VALUES (v_tlink_blocos_id,vTabDinOriId,'ID',vTabDinDesId,'ITEMPR_ID',0,1);
 SELECT ID   INTO vTabDinOriId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TITENS_CUSTOS'    AND bloco = 'TITENS_CUSTOS'    AND cab_din_id = vCabDinId; SELECT ID   INTO vTabDinDesId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TITENS_CUSTOS_CONF'    AND bloco = 'TITENS_CUSTOS_CONF'    AND cab_din_id = vCabDinId; SELECT seq_id_tlink_blocos_cab_din.nextval INTO v_tlink_blocos_id FROM dual;
 INSERT INTO tlink_blocos_cab_dinamico(id,bloco_origem_id,coluna_origem,bloco_destino_id,coluna_destino,outer_origem,outer_destino) VALUES (v_tlink_blocos_id,vTabDinOriId,'ID',vTabDinDesId,'ITCT_ID',0,1);
 SELECT ID   INTO vTabDinOriId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TMASC_ITEM'    AND bloco = 'TMASC_ITEM'    AND cab_din_id = vCabDinId; SELECT ID   INTO vTabDinDesId   FROM tblocos_cab_dinamico b  WHERE tabela = 'TITENS_CUSTOS_CONF'    AND bloco = 'TITENS_CUSTOS_CONF'    AND cab_din_id = vCabDinId; SELECT seq_id_tlink_blocos_cab_din.nextval INTO v_tlink_blocos_id FROM dual;
 INSERT INTO tlink_blocos_cab_dinamico(id,bloco_origem_id,coluna_origem,bloco_destino_id,coluna_destino,outer_origem,outer_destino) VALUES (v_tlink_blocos_id,vTabDinOriId,'ID',vTabDinDesId,'TMASC_ITEM_ID',0,1);
end;

   SELECT tgrp_clas_ite.cod_grp_ite
         , titens.cod_item cod_item
         , titens.cod_item cod_item_pai
         , titens.desc_tecnica desc_tecnica_pai
         , tcad_est_ite.seq_ord seq_filho
         , titens1.cod_item cod_item_filho
         , titens1.desc_tecnica desc_tecnica_filho
        #  , toperacao.cod_oper
         , toperacao.cod_operacao
         ,
          (CASE
              WHEN tcad_est_ite.tp_estrutura = 'F'
                 THEN '100'
              ELSE (SELECT TO_CHAR (NVL (SUM (con.per_consumo), 0))
                      FROM troteiro rot, tconsumos con, toperacao oper
                     WHERE rot.itempr_id = titens_empr.ID
                       AND con.troteiro_id = rot.ID
                       AND rot.operacao_id = oper.ID
                       AND con.seq_ord = tcad_est_ite.seq_ord
                       AND con.itempr_id = titens_empr1.ID)
           END
          ) consumo_filho
     FROM titens titens1
         , titens_empr titens_empr
         , titens_engenharia titens_engenharia
         , titens_empr titens_empr1
         , titens_engenharia titens_engenharia1
         , tcad_est_ite tcad_est_ite
         , titens titens
         , tgrp_clas_ite tgrp_clas_ite
         , toperacao toperacao
    WHERE titens.ID = titens_empr.item_id
      AND titens_empr.ID = titens_engenharia.itempr_id
      AND tgrp_clas_ite.ID = titens_engenharia.grp_clas_id
      AND titens1.ID(+) = titens_empr1.item_id
      AND titens_empr1.ID = titens_engenharia1.itempr_id
      AND titens1.ID = tcad_est_ite.filho_id
      AND titens.ID = tcad_est_ite.pai_id
      AND tcad_est_ite.tp_estrutura <> 'I'
      AND titens_empr.empr_id = tcad_est_ite.empr_id
      AND titens_empr1.empr_id = tcad_est_ite.empr_id
      -- AND toperacao.ID = tcad_est_ite.operacao_id
      AND (tcad_est_ite.empr_id = 1)
      AND titens.sit = 1
      AND titens1.sit = 1
   UNION
   SELECT tgrp_clas_ite.cod_grp_ite cod_grp_ite
         , titens.cod_item cod_item
         ,
          (CASE
              WHEN tcad_est_ite.tp_estrutura = 'F'
                 THEN titens.cod_item
              ELSE titens1.cod_item
           END
          ) cod_item_pai,
          (CASE
              WHEN tcad_est_ite.tp_estrutura = 'F'
                 THEN titens.desc_tecnica
              ELSE titens1.desc_tecnica
           END
          ) desc_tecnica_pai
            , tcad_est_ite1.seq_ord seq_filho
            , titens2.cod_item cod_item_filho 
            , titens2.desc_tecnica desc_tecnica_filho
            , toperacao.cod_operacao
            , 
          (CASE
              WHEN titens_engenharia1.tp_item = 'C'
               OR tcad_est_ite1.tp_estrutura = 'F'
                 THEN '100'
              ELSE CASE
              WHEN tcad_est_ite.tp_estrutura = 'F'
                 THEN (SELECT TO_CHAR (NVL (SUM (con.per_consumo), 0))
                         FROM troteiro rot, tconsumos con, toperacao oper
                        WHERE rot.itempr_id = titens_empr.ID
                          AND con.troteiro_id = rot.ID
                          AND rot.operacao_id = oper.ID
                          AND con.seq_ord = tcad_est_ite1.seq_ord
                          AND con.itempr_id = titens_empr2.ID)
              ELSE (SELECT TO_CHAR (NVL (SUM (con.per_consumo), 0))
                      FROM troteiro rot, tconsumos con, toperacao oper
                     WHERE rot.itempr_id = titens_empr1.ID
                       AND con.troteiro_id = rot.ID
                       AND rot.operacao_id = oper.ID
                       AND con.seq_ord = tcad_est_ite1.seq_ord
                       AND con.itempr_id = titens_empr2.ID)
           END
           END
          ) consumo_filho
     FROM titens titens1
         , titens_empr titens_empr
         , titens_engenharia titens_engenharia
         , titens_empr titens_empr2
         , tcad_est_ite tcad_est_ite1
         , titens titens2
         , titens_empr titens_empr1
         , titens_engenharia titens_engenharia1
         , tcad_est_ite tcad_est_ite
         , titens titens
         , tgrp_clas_ite tgrp_clas_ite
         , titens_engenharia titens_engenharia2
         , toperacao toperacao
    WHERE titens.ID = titens_empr.item_id
      AND titens_empr.ID = titens_engenharia.itempr_id
      AND tgrp_clas_ite.ID = titens_engenharia.grp_clas_id
      AND titens2.ID = titens_empr2.item_id(+)
      AND titens1.ID = tcad_est_ite1.pai_id(+)
      AND titens2.ID(+) = tcad_est_ite1.filho_id
      AND titens1.ID(+) = titens_empr1.item_id
      AND titens_empr1.ID = titens_engenharia1.itempr_id
      AND titens.ID = tcad_est_ite.pai_id
      AND titens1.ID = tcad_est_ite.filho_id
      AND tcad_est_ite.tp_estrutura <> 'I'
      AND titens_empr2.ID = titens_engenharia2.itempr_id(+)
      AND titens_empr.empr_id = tcad_est_ite.empr_id
      AND titens_empr1.empr_id = tcad_est_ite.empr_id
      AND titens_empr2.empr_id = tcad_est_ite.empr_id
      AND (tcad_est_ite.empr_id = 1)
      AND titens.sit = 1
      AND titens1.sit = 1
      AND titens2.sit = 1
      AND titens_engenharia1.tp_item = 'F'
      -- AND toperacao.ID = tcad_est_ite.operacao_id
   UNION
   SELECT tgrp_clas_ite.cod_grp_ite cod_grp_ite, titens.cod_item cod_item,
          (CASE
              WHEN tcad_est_ite1.tp_estrutura = 'F'
                 THEN titens1.cod_item
              ELSE titens2.cod_item
           END
          ) cod_item_pai,
          (CASE
              WHEN tcad_est_ite.tp_estrutura = 'F'
                 THEN titens.desc_tecnica
              ELSE titens1.desc_tecnica
           END
          ) desc_tecnica_pai
            , tcad_est_ite2.seq_ord seq_filho
            , titens3.cod_item cod_item_filho
            , titens3.desc_tecnica desc_tecnica_filho
            , toperacao.cod_operacao
            ,
          (CASE
              WHEN titens_engenharia2.tp_item = 'C'
               OR tcad_est_ite2.tp_estrutura = 'F'
                 THEN '100'
              ELSE CASE
              WHEN tcad_est_ite1.tp_estrutura = 'F'
                 THEN (SELECT TO_CHAR (NVL (SUM (con.per_consumo), 0))
                         FROM troteiro rot, tconsumos con, toperacao oper
                        WHERE rot.itempr_id = titens_empr1.ID
                          AND con.troteiro_id = rot.ID
                          AND rot.operacao_id = oper.ID
                          AND con.seq_ord = tcad_est_ite2.seq_ord
                          AND con.itempr_id = titens_empr3.ID)
              ELSE (SELECT TO_CHAR (NVL (SUM (con.per_consumo), 0))
                      FROM troteiro rot, tconsumos con, toperacao oper
                     WHERE rot.itempr_id = titens_empr2.ID
                       AND con.troteiro_id = rot.ID
                       AND rot.operacao_id = oper.ID
                       AND con.seq_ord = tcad_est_ite2.seq_ord
                       AND con.itempr_id = titens_empr3.ID)
           END
           END
          ) consumo_filho
     FROM titens_empr titens_empr
         , titens_engenharia titens_engenharia
         , titens_empr titens_empr2
         , tcad_est_ite tcad_est_ite1
         , titens titens2
         , titens_empr titens_empr1
         , titens_engenharia titens_engenharia1
         , tcad_est_ite tcad_est_ite
         , titens titens1
         , titens titens
         , tgrp_clas_ite tgrp_clas_ite
         , titens_engenharia titens_engenharia2
         , tcad_est_ite tcad_est_ite2
         , titens titens3
         , titens_empr titens_empr3
         , titens_engenharia titens_engenharia3
         , toperacao operacao
    WHERE titens.ID = titens_empr.item_id
      AND tgrp_clas_ite.ID = titens_engenharia.grp_clas_id
      AND titens_empr.ID = titens_engenharia.itempr_id
      AND titens2.ID = titens_empr2.item_id(+)
      AND titens2.ID(+) = tcad_est_ite1.filho_id
      AND titens1.ID = tcad_est_ite1.pai_id(+)
      AND titens1.ID(+) = titens_empr1.item_id
      AND titens_empr1.ID = titens_engenharia1.itempr_id
      AND titens1.ID = tcad_est_ite.filho_id
      AND titens.ID = tcad_est_ite.pai_id
      AND titens_empr2.ID = titens_engenharia2.itempr_id(+)
      AND titens3.ID(+) = tcad_est_ite2.filho_id
      AND titens2.ID = tcad_est_ite2.pai_id(+)
      AND titens3.ID = titens_empr3.item_id(+)
      AND titens_empr3.ID = titens_engenharia3.itempr_id(+)
      AND titens_empr.empr_id = tcad_est_ite.empr_id
      AND titens_empr1.empr_id = tcad_est_ite.empr_id
      AND titens_empr2.empr_id = tcad_est_ite.empr_id
      AND titens_empr3.empr_id = tcad_est_ite.empr_id
      AND (tcad_est_ite.empr_id = 1)
      AND tcad_est_ite.tp_estrutura <> 'I'
      AND titens.sit = 1
      AND titens1.sit = 1
      AND titens2.sit = 1
      AND titens3.sit = 1
      AND titens_engenharia2.tp_item = 'F'
      -- AND toperacao.ID = tcad_est_ite.operacao_id
   UNION
   SELECT tgrp_clas_ite.cod_grp_ite cod_grp_ite
         , titens.cod_item cod_item
         ,
          (CASE
              WHEN tcad_est_ite2.tp_estrutura = 'F'
                 THEN titens2.cod_item
              ELSE titens3.cod_item
           END
          ) cod_item_pai
          ,
          (CASE
              WHEN tcad_est_ite.tp_estrutura = 'F'
                 THEN titens.desc_tecnica
              ELSE titens1.desc_tecnica
           END
          ) desc_tecnica_pai
            , tcad_est_ite3.seq_ord seq_filho
            , titens4.cod_item cod_item_filho
            , titens4.desc_tecnica desc_tecnica_filho
            , toperacao.cod_oeracao
            ,
          (CASE
              WHEN titens_engenharia3.tp_item = 'C'
               OR tcad_est_ite3.tp_estrutura = 'F'
                 THEN '100'
              ELSE CASE
              WHEN tcad_est_ite2.tp_estrutura = 'F'
                 THEN (SELECT TO_CHAR (NVL (SUM (con.per_consumo), 0))
                         FROM troteiro rot, tconsumos con, toperacao oper
                        WHERE rot.itempr_id = titens_empr2.ID
                          AND con.troteiro_id = rot.ID
                          AND rot.operacao_id = oper.ID
                          AND con.seq_ord = tcad_est_ite3.seq_ord
                          AND con.itempr_id = titens_empr4.ID)
              ELSE (SELECT TO_CHAR (NVL (SUM (con.per_consumo), 0))
                      FROM troteiro rot, tconsumos con, toperacao oper
                     WHERE rot.itempr_id = titens_empr3.ID
                       AND con.troteiro_id = rot.ID
                       AND rot.operacao_id = oper.ID
                       AND con.seq_ord = tcad_est_ite3.seq_ord
                       AND con.itempr_id = titens_empr4.ID)
           END
           END
          ) consumo_filho
     FROM titens_empr titens_empr
         , titens_engenharia titens_engenharia
         , titens_empr titens_empr2
         , tcad_est_ite tcad_est_ite1
         , titens titens2
         , titens_empr titens_empr1
         , titens_engenharia titens_engenharia1
         , tcad_est_ite tcad_est_ite
         , titens titens1
         , titens titens
         , tgrp_clas_ite tgrp_clas_ite
         , titens_engenharia titens_engenharia2
         , tcad_est_ite tcad_est_ite2
         , titens titens3
         , titens_empr titens_empr3
         , titens_engenharia titens_engenharia3
         , tcad_est_ite tcad_est_ite3
         , titens titens4
         , titens_empr titens_empr4
         , titens_engenharia titens_engenharia4
         , toperacao toperacao
    WHERE titens.ID = titens_empr.item_id
      AND titens_empr.ID = titens_engenharia.itempr_id
      AND tgrp_clas_ite.ID = titens_engenharia.grp_clas_id
      AND titens2.ID = titens_empr2.item_id(+)
      AND titens1.ID = tcad_est_ite1.pai_id(+)
      AND titens2.ID(+) = tcad_est_ite1.filho_id
      AND titens1.ID(+) = titens_empr1.item_id
      AND titens_empr1.ID = titens_engenharia1.itempr_id
      AND titens.ID = tcad_est_ite.pai_id
      AND titens1.ID = tcad_est_ite.filho_id
      AND titens_empr2.ID = titens_engenharia2.itempr_id(+)
      AND titens3.ID(+) = tcad_est_ite2.filho_id
      AND titens2.ID = tcad_est_ite2.pai_id(+)
      AND titens3.ID = titens_empr3.item_id(+)
      AND titens_empr3.ID = titens_engenharia3.itempr_id(+)
      AND titens4.ID = tcad_est_ite3.filho_id
      AND titens3.ID = tcad_est_ite3.pai_id
      AND titens4.ID = titens_empr4.item_id
      AND titens_empr4.ID = titens_engenharia4.itempr_id
      AND titens_empr.empr_id = tcad_est_ite.empr_id
      AND titens_empr1.empr_id = tcad_est_ite.empr_id
      AND titens_empr2.empr_id = tcad_est_ite.empr_id
      AND titens_empr3.empr_id = tcad_est_ite.empr_id
      AND titens_empr4.empr_id = tcad_est_ite.empr_id
      AND (tcad_est_ite.empr_id = 1)
      AND tcad_est_ite.tp_estrutura <> 'I'
      AND titens.sit = 1
      AND titens1.sit = 1
      AND titens2.sit = 1
      AND titens3.sit = 1
      AND titens4.sit = 1
      -- AND toperacao.ID = tcad_est_ite.operacao_id;

SELECT TEMPRESAS.COD_EMP||' - '||TEMPRESAS.RAZAO_SOCIAL Empresa,
       TITENS.COD_ITEM||' - '||TITENS.DESC_TECNICA Item,
       TALMOXARIFADOS.COD_ALMOX||' - '||TALMOXARIFADOS.DESCRICAO Almoxarifado,
       TLOTES.COD_LOTE Lote,
       TO_CHAR(( SELECT MAX(DT)
  FROM TMOV_ESTQ WHERE ITESTQ_ID = TITENS_ESTOQUE.ID AND NVL(ITE_LOTE_ID,0) = NVL(TITENS_LOTE.ID,0)  ), 'MM/RRRR') Ult_Movimento,
       MAN_EST_RETORNA_SALDO( TITENS_EMPR.EMPR_ID, TITENS_EMPR.ITEM_ID, TALMOXARIFADOS.COD_ALMOX, SYSDATE, 'NAO', NULL, NULL, TITENS_LOTE.ID) Qtde
  FROM TEMPRESAS TEMPRESAS,
       TITENS_EMPR TITENS_EMPR,
       TITENS TITENS,
       TALMOXARIFADOS TALMOXARIFADOS,
       TITENS_ESTOQUE TITENS_ESTOQUE,
       TITENS_LOTE TITENS_LOTE,
       TLOTES TLOTES
 WHERE TITENS.ID = TITENS_EMPR.ITEM_ID
   AND TEMPRESAS.ID = TITENS_EMPR.EMPR_ID
   AND TEMPRESAS.ID = TALMOXARIFADOS.EMPR_ID
   AND TITENS_EMPR.ID = TITENS_ESTOQUE.ITEMPR_ID
   AND TITENS_EMPR.ID = TITENS_LOTE.ITEMPR_ID(+)
   AND TLOTES.ID(+) = TITENS_LOTE.LOT_ID
   AND (( TITENS.COD_ITEM in ('010100028','60M1939.1')))
   AND MAN_EST_RETORNA_SALDO( TITENS_EMPR.EMPR_ID, TITENS_EMPR.ITEM_ID, TALMOXARIFADOS.COD_ALMOX, SYSDATE, 'NAO', NULL, NULL, TITENS_LOTE.ID) <> 0
ORDER BY TEMPRESAS.COD_EMP||' - '||TEMPRESAS.RAZAO_SOCIAL ASC, 
         TITENS.COD_ITEM ASC, 
         TALMOXARIFADOS.COD_ALMOX ASC, 
         TLOTES.COD_LOTE ASC
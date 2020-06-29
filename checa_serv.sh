#!/usr/bin/bash
set -x

DATA_AAAAMMDD=`date '+%Y%m%d'`
HORA_HHMMSS=`date '+%H%M%S'`
DIR_SCRIPTS=/scripts
DIR_LOG=/log
ARQ_LOG=checa_serv_${DATA_AAAAMMDD}_${HORA_HHMMSS}.log


curl localhost:8081 >> ${DIR_LOG}/${ARQ_LOG}

mailx -s "Status do servicos" -r suporte@domain.com.br suporte@domain.com.br < ${DIR_LOG}/${ARQ_LOG}

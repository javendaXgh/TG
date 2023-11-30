library(flextable)
####################################################################################
# Datos Entrada
####################################################################################

titulo_tabla <- 'SCSU UC.__'

nombre_uc <- 'UC.1: Realizar proceso de recuperación de información (query)'

descripcion_uc <- 'El usuario realiza búsquedas sobre los textos que conforman el Corpus del Prototipo'

actor_uc <- 'usuario'

flujo_basico <- 'El caso de uso inicia cuando el usuario ingresa a la aplicación y el prototipo muesta dos campos: \n 1) En el primero debe introducir el texto a buscar. \n 2) En el segundo, en el que aparece por defecto el valor 60, se corresponde con las cantidades de coocurrencias que serán presentadas en los "Mapas del Conocimiento". \n 3) El usuario hace "click" en el "buscar palabras" \n 4) El Prototipo presenta los resultados obtenidos \n 4) El caso de uso termina'

#######flujo alternativo
flu_alt_titulo <- c('N/A')
flu_alt_descrip <- c('N/A')

#######Precondiciones
precond_titulo <- c('N/A')
precond_descri <- c('N/A')

#######Postcondiciones
postcond_titulo <- c('Éxito','Fracaso')
postcond_descri <- c('El prototipo presenta: \n 1) Total de investigaciones por jeraraquías de las investigaciones que fueron recuperadas \n 2) Gráfico con "Mapas de Conocimiento". \n 3) Tabla con datos de los texto Resumen recuperados de acuerdo al query','N/A')

####################################################################################
# Otras variables
####################################################################################

df_encabezado=data.frame(`a`=c('Nombre',
                               'Descripción',
                               'Actor',
                               'Flujo de Eventos',
                               'Flujo Básico',
                               flujo_basico,
                               'Flujo Alternativo',
                               'Título'),
                         `b`=c(nombre_uc,
                               descripcion_uc,
                               actor_uc,
                               '',
                               '',
                               '',
                               '',
                               'Descripción'))


df_flujo_alt <- data.frame(`a`=flu_alt_titulo,
                           `b`=flu_alt_descrip)

df_precondiciones <- data.frame(`a`=c('Precondiciones',
                                      'Título',
                                      precond_titulo),
                                `b`=c('',
                                      'Descripción',
                                      precond_descri))

df_postcondiciones <- data.frame(`a`=c('Postcondiciones',
                                       'Título',
                                       postcond_titulo),
                                 `b`=c('',
                                       'Descripción',
                                       postcond_descri))


indice_1=nrow(df_encabezado)+nrow(df_flujo_alt)+1
indice_2=nrow(df_encabezado)+nrow(df_flujo_alt)+nrow(df_precondiciones)+1
######

df_salida <- bind_rows(df_encabezado,
                df_flujo_alt,
                df_precondiciones,
                df_postcondiciones)


flextable(df_salida)%>%
  delete_part(part = "header")%>%
  theme_box()%>%
  fontsize(size = 10)%>%
  bg(i=1,j=1, bg = "#C2C2C2", part = "body")%>%
  bg(i=2,j=1, bg = "#C2C2C2", part = "body")%>%
  bg(i=3,j=1, bg = "#C2C2C2", part = "body")%>%
  merge_at(i=4)%>%
  bg(i=4, bg = "#8F8F8F", part = "body")%>%
  merge_at(i=5)%>%
  bg(i=5, bg = "#A3A3A3", part = "body")%>%
  merge_at(i=6)%>%
  merge_at(i=7)%>%
  bg(i=7, bg = "#A3A3A3", part = "body")%>%
  bg(i=8, bg = "#C2C2C2", part = "body")%>%
  merge_at(i=indice_1)%>%
  bg(i=indice_1, bg = "#A3A3A3", part = "body")%>%
  bg(i=indice_1+1, bg = "#C2C2C2", part = "body")%>%
  merge_at(i=indice_2)%>%
  bg(i=indice_2, bg = "#A3A3A3", part = "body")%>%
  bg(i=indice_2+1, bg = "#C2C2C2", part = "body")%>%
  set_caption(caption=titulo_tabla)%>%
  align(i=4, align = 'center')%>%
  # align(i=5, align = 'center')%>%
  align(i=indice_1, align = 'center')%>%
  align(i=indice_2, align = 'center')%>%
  width(j = 1, width = 1)%>%
  width(j = 2, width = 6)%>%
  height(height = .1)


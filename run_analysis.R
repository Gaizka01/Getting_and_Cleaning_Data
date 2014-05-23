#course project data reading    
library (stringr)
#Generando nombres de variables, sólo mean() y std()
varnames = read.table("features.txt", sep ="")
x = str_split_fixed(varnames$V2, pattern = "-", n = 3)
y = paste(x[,1], x[,2], sep = " ")
m = x[x[,2]=="mean()" | x[,2]=="std()",]
col = paste(m[,1], m[,2])
#fusionando los datos del grupo test y train, sólo mean() y std()
xtest = read.table("X_test.txt")
xtrain = read.table("X_train.txt")
vec = which(x[,2]=="mean()" | x[,2]=="std()")
xmeansd = rbind (xtest[,vec], xtrain[,vec])
colnames(xmeansd) = col
#fusión de columnas
fusion = t(apply(xmeansd, 1, function(x) tapply(x, colnames(xmeansd), mean)))
#identificando a los individuos
xsubj = read.table("subject_test.txt")
ysubj = read.table("subject_train.txt")
individuos = rbind(xsubj, ysubj)
#nombres adecuados a las actividades
ytrain = read.table("y_train.txt")
ytest = read.table("y_test.txt")
ytrain[1,1] = 5 #para corregir caracteres extraños
ytest[1,1] = 5 #para corregir caracteres extraños
activity = rbind(ytest, ytrain)
act = read.table("activity_labels.txt", sep = " ")
actname = function(act, activity){
        n = NULL
        for (i in seq_along(activity[,1])){
                if (activity[i,1] == 1){
                        n[i] = "WALKING"
                }
                if (activity[i,1] == 2){
                        n[i] = "WALKING_UPSTAIRS"
                }
                if (activity[i,1] == 3){
                        n[i] = "WALKING_DOWNSTAIRS"
                }
                if (activity[i, 1] == 4){
                        n[i] = "SITTING"
                }
                if (activity[i,1] == 5){
                        n[i] = "STANDING"
                }
                if (activity[i,1] == 6){
                        n[i] = "LAYING"
                }
        }
        return (n)
}
actividades = actname(act, activity)
#metiendo todo en un solo data frame
completo =cbind (fusion, individuos, actividades)
#agregando por filas y data final
fila = paste(completo[, 35], completo[, 36])
res = apply(completo[,1:34], 2, function(x) tapply(x, fila, mean))
write.table(res, file = "tidydata.txt")
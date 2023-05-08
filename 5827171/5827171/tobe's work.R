df = read.csv('fraud_oracle.csv')

#clean data
sum(is.na(df))
df_1<- df[df$FraudFound_P==1,]

n_1<-round(nrow(df_1)*0.4)

df_0<- df[df$FraudFound_P ==0,]

n_0<-round(nrow(df_1)*0.6)

f_2000 <- head(df, 2000)

result<-head(rbind(df_1[sample(nrow(df_1),n_1), ], df_0[sample(nrow(df_0),n_0), ]), 923)

#randomizing data
df_randomized <- df[sample(nrow(df)), ]

# Reset the row names/index
rownames(df_randomized) <- NULL

# Print the randomized dataframe with new index
print(df_randomized)

write.csv(df_randomized, 'new_data.csv', row.names=FALSE)
write.csv(f_2000, 'f_2000.csv', row.names=FALSE)


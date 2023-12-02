library(data.table)

df <- fread("input_1_2023.txt",header=T)
df <- unlist(c(names(df),df[,1])) %>%
  data.frame() %>%
  rename("var" = ".")
row.names(df) <- NULL

df$val <- 0
df$num_str <- "Empty"
for(i in 1:nrow(df)){
  df$num_str[i] <- str_flatten(unlist(str_extract_all(df$var[i], "\\d+")))
  df$amount[i] <- nchar(df$num_str[i])
  if(amount == 1){
    df$val[i] <- as.numeric(paste0(df$num_str[i],df$num_str[i]))
  } else{
    df$val[i] <- as.numeric(paste0(substr(df$num_str[i],1,1),substr(df$num_str[i],df$amount[i],df$amount[i])))
  }
}

sum(df$val)
#55108


num_written_out <- c("twone", "oneight", "threeight", "nineight", "sevenine", "eightwo",
                     "one", "two", "three", "four", "five", "six", "seven", "eight", "nine")
num_written_out_order <- c(21, 18, 38, 98, 79, 82, 1:9)

df$original_var <- df$var
for(j in 1:length(num_written_out)){
  df$var <- str_replace_all(df$var, num_written_out[j], as.character(num_written_out_order[j]))
}

df$val <- 0
df$num_str <- "Empty"
for(i in 1:nrow(df)){
  df$num_str[i] <- str_flatten(unlist(str_extract_all(df$var[i], "\\d+")))
  df$amount[i] <- nchar(df$num_str[i])
  if(amount == 1){
    df$val[i] <- as.numeric(paste0(df$num_str[i],df$num_str[i]))
  } else{
    df$val[i] <- as.numeric(paste0(substr(df$num_str[i],1,1),substr(df$num_str[i],df$amount[i],df$amount[i])))
  }
}

sum(df$val)
#56324
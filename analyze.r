
library(tidyverse)
library(RColorBrewer) # color palettes


workers_data <- read.csv("workers_data.csv")


questionary <- workers_data %>%
  filter(worker_paid == "True") %>%
  filter(platform == "mturk") %>%
  select(starts_with(c("q_0_", "worker_id"))) %>%
  distinct 

questionary2 <- aggregate(q_0_0_required ~ q_0_0_answer_text, data = questionary, FUN = sum)
questionary2$q_0_0_answer_text_percent <- round((questionary2$q_0_0_required/sum(questionary2$q_0_0_required))*100, 2)

ggplot(questionary2 %>% mutate(TC=paste(q_0_0_answer_text_percent, suffix ="%" )),
       aes(x=q_0_0_answer_text, y=q_0_0_answer_text_percent, fill=q_0_0_answer_text)) +
  geom_bar(stat="identity")+
  scale_fill_brewer(palette="Set2") +
 geom_text(aes(label=TC), vjust=1.6, color="black", size=3.5)+
  labs(
    x = "What is your main use on Twitter?",
    y = "Relative frequency",
  ) +
  scale_x_discrete(limits = c("Entertainment", "Politics", "Current news", "Other things")) +
  theme_minimal()+ theme(legend.title	=element_blank()) 


questionary2 <- aggregate(q_0_1_required ~ q_0_1_answer_text, data = questionary, FUN = sum)
questionary2$q_0_1_answer_text_percent <- round((questionary2$q_0_1_required/sum(questionary2$q_0_1_required))*100, 2)

ggplot(questionary2 %>% mutate(TC=paste(q_0_1_answer_text_percent, suffix ="%" )),
       aes(x=q_0_1_answer_text, y=q_0_1_answer_text_percent, fill=q_0_1_answer_text)) +
  geom_bar(stat="identity")+
  scale_fill_brewer(palette="Set2") +
 geom_text(aes(label=TC), vjust=1.6, color="black", size=3.5)+
  labs(
    x = "How long do you spend on Twitter every day?",
    y = "Relative frequency",
  ) +
  scale_x_discrete(limits = c("Less then 5 min", "Between 10 or 20 min", "More then half an hour")) +
  theme_minimal()+ theme(legend.title	=element_blank()) 




questionary2 <- aggregate(q_0_2_required ~ q_0_2_answer_text, data = questionary, FUN = sum)
questionary2$q_0_2_answer_text_percent <- round((questionary2$q_0_2_required/sum(questionary2$q_0_2_required))*100, 2)

ggplot(questionary2 %>% mutate(TC=paste(q_0_2_answer_text_percent, suffix ="%" )),
       aes(x=q_0_2_answer_text, y=q_0_2_answer_text_percent, fill=q_0_2_answer_text)) +
  geom_bar(stat="identity")+
  scale_fill_brewer(palette="Set2") +
 geom_text(aes(label=TC), vjust=1.6, color="black", size=3.5)+
  labs(
    x = "How often do you have an active interaction with tweet or retweet?",
    y = "Relative frequency",
  ) +
  scale_x_discrete(limits = c("Every day", "Twice a week", "Every week", "I don't have any")) +
  theme_minimal()+ theme(legend.title	=element_blank()) 





questionary2 <- aggregate(q_0_3_required ~ q_0_3_answer_text, data = questionary, FUN = sum)
questionary2$q_0_3_answer_text_percent <- round((questionary2$q_0_3_required/sum(questionary2$q_0_3_required))*100, 2)

ggplot(questionary2 %>% mutate(TC=paste(q_0_3_answer_text_percent, suffix ="%" )),
       aes(x=q_0_3_answer_text, y=q_0_3_answer_text_percent, fill=q_0_3_answer_text)) +
  geom_bar(stat="identity")+
  scale_fill_brewer(palette="Set2") +
 geom_text(aes(label=TC), vjust=1.6, color="black", size=3.5)+
  labs(
    x = "Have you ever bought something that you have seen it on Twitter?",
    y = "Relative frequency",
  ) +
  scale_x_discrete(limits = c("Yes", "No")) +
  theme_minimal()+ theme(legend.title	=element_blank()) 

#calcolo lunghezza(Caratteri) giustificazioni: lunghezza media, giust lung max e min

z<-workers_data %>% filter(nchar(workers_data$doc_tweetAbout_justification)>0)
k<-nchar(z$doc_tweetAbout_justification)
mean(k)

z[which(k == max(k)),"doc_tweetAbout_justification"]
max(k)

z[which(k == min(k)),"doc_tweetAbout_justification"]
min(k)

#calcolo lunghezza(Parole) giustificazioni : lunghezza media, giust lung max e min


split <- strsplit(z$doc_tweetAbout_justification, " ")
k1<-sapply( split , length)


mean(k1)

z[which(k1 == max(k1)),"doc_tweetAbout_justification"]
max(k1)

z[which(k1 == min(k1)),"doc_tweetAbout_justification"]
min(k1)



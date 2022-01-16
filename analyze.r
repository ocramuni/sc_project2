library(tidyverse)
library(RColorBrewer) # color palettes


workers_data <- read.csv("result/SocComP2/Dataframe/workers_data.csv")


questionary <- workers_data %>%
  filter(worker_paid == "True") %>%
  filter(platform == "mturk") %>%
  select(starts_with(c("q_0_", "worker_id"))) %>%
  distinct

ggplot(questionary, aes(q_0_0_answer_text, fill=q_0_0_answer_text, y = ..prop.., group = 1)) +
  geom_bar(stat="count") +
  scale_fill_brewer(palette="Set2") +
  geom_text(stat='count', aes(label=..prop..), vjust=1.6, color="white", size=3.5)+
  labs(
    x = "What is your main use on Twitter?",
    y = "Relative frequency",
  ) +
  scale_x_discrete(limits = c("Entertainment", "Politics", "Current news", "Other things")) +
  theme_minimal()

ggplot(questionary, aes(q_0_0_answer_text, fill=q_0_0_answer_text)) +
  geom_bar(stat="count") +
  scale_fill_brewer(palette="Set2") +
  geom_text(stat='count', aes(label=..count..), vjust=1.6, color="black", size=3.5)+
  labs(
    x = "What is your main use on Twitter?",
    y = "Relative frequency",
    fill = NULL
  ) +
  scale_x_discrete(limits = c("Entertainment", "Politics", "Current news", "Other things")) +
  theme_minimal()


questionary %>%
  ggplot(aes(q_0_1_answer_text, fill=q_0_1_answer_text, y = ..prop.., group = 1)) +
  geom_bar(stat="count") +
  scale_fill_brewer(palette="Set2") +
  geom_text(stat='count', aes(label=..prop..), vjust=1.6, color="white", size=3.5)+
  labs(
    x = "How long do you spend on Twitter every day?",
    y = "Relative frequency",
  ) +
  scale_x_discrete(limits = c("Less then 5 min", "Between 10 or 20 min", "More then half an hour")) +
  theme_minimal()

ggplot(questionary, aes(q_0_2_answer_text, fill=q_0_2_answer_text, y = ..prop.., group = 1)) +
  geom_bar(stat="count") +
  geom_text(stat='count', aes(label=..prop..), vjust=1.6, color="white", size=3.5)+
  labs(
    x = "How often do you have an active interaction with tweet or retweet?",
    y = "Relative frequency",
  ) +
  scale_x_discrete(limits = c("Every day", "Twice a week", "Every week", "I don't have any")) +
  theme_minimal()

ggplot(questionary, aes(fct_rev(q_0_3_answer_text), fill=q_0_3_answer_text, y = ..prop.., group = 1)) +
  geom_bar(stat="count") +
  geom_text(stat='count', aes(label=..prop..), vjust=1.6, color="white", size=3.5)+
  labs(
    x = "Have you ever bought something that you have seen it on Twitter?",
    y = "Relative frequency",
  ) +
  theme_minimal()
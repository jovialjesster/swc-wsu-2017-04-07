1 + 100
1 == 2

x <- 1/40
log(x)
x + x
x <- 100
x
y <- c(1, 4.5, 2.7, 9)
y
z <- 1:5
z
animals <- c("monkey", "rabbit", "dog")
animals
# Create a vector of animals
# add 4 to each element of y
y + 4
paste("The animal is:", animals)
#save y as the original y + 4
y <- y + 4
#inspect the type of object
typeof(y)
typeof(z)
typeof(animals)

new_vec <- c(5, 7.5, "hat")
typeof(new_vec)
new_vec

mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20
mass < age
mass > age

# delete a vector
rm(new_vec)
new_vec

# loading data
cats <- read.csv(file = "data/feline-data.csv")
cats <- read.csv(file = "data/data/feline-data.csv")
cats
class(cats)

# extract a column
cats$weight
cats$coat

rm(age)
rm(animals)
rm(mass)
rm(x)

cats$weight + 2
cats

# show the structure of an object
str(cats)

# avoid having a cetegory labeled as 'Factor' (read in data without treating strings as factors)
cats2 <- read.csv(file = "data/data/feline-data.csv", stringsAsFactors = FALSE)
str(cats2)

# read in gapminder
gapminder <-  read.csv(file = "data/data/gapminder.csv", stringsAsFactors = FALSE)

str(gapminder)

#number of rows/columns etc
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
colnames(gapminder)

#viewing start and end rows, 6 if not specified with n
head(gapminder)
tail(gapminder)
head(gapminder, n =10)

# summarize data
summary(gapminder)

#subsetting
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
x
names(x) <- c("a", "b", "c", "d", "e")
x

# indexing
x[1]
x[4]
x[c(1,3)]
x[1:4]
x[1,3]
x[c(1, 1, 3)]
x[6]

# excluding
x[-2]
x[c(-1, -5)]

# subsetting by name
x[c("a", "c")]
x[-"a"]

# challenge 1

x[c("b", "c", "d")]
x[c(-1, -5)]
x[2:4]
x[c(2, 3, 4)]

# logical subsetting
x > 6
x[x > 6]
x[x < 7]

length(x)
x_new <- x[x > 6]
length(x_new)

# data frame subsetting
gapminder$year
gapminder[1:3,]
gapminder[3,]
gapminder[1:3, 1:3]
gapminder[, c("lifeExp", "pop")]

gapminder$year < 1960
gapminder[gapminder$year < 1960, c("year", "pop")]

# challenge 7
gapminder[gapminder$year == 1957,]
gapminder[,1:4]
gapminder[,2:4]
gapminder[gapminder$lifeExp > 80,]
gapminder[1,c("lifeExp", "gdpPercap")]
gapminder[gapminder$year == 2002 | gapminder$year == 2007,]
gapminder[, -(1:4)]
as.logical(2007)
gapminder[gapminder$year %in% c(2002, 2007),]

#plotting
# installing the package
install.packages("ggplot2")
#load the package (needs to be done in each new R session when you want to use it)
library("ggplot2")

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()

# life exp over time colored by continent, scatter plot
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent)) + geom_point()

# life exp over time colored by continent line
ggplot(data = gapminder, aes(x = year, y = lifeExp, color = continent, by = country)) +
  geom_line() +
  geom_point()

ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) +
  geom_line(aes(color = continent)) +
  geom_point()

ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) +
  geom_point() +
  geom_line(aes(color = continent))
 
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + 
  geom_point() +
  scale_x_log10()

# adding a line of best fit
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() +
  scale_x_log10() +
  geom_smooth(method = "lm")

# facetting

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~ continent)

# facet grid

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  scale_x_log10() +
  facet_grid(year ~ continent)

# subsetting data before plotting
asia <- gapminder[gapminder$continent == "Asia",]

ggplot(asia, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# modifying text

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() +
  xlab("GDP per capita") +
  ylab("Life Expectancy") +
  ggtitle("Figure 1") +
  theme_bw() +
  ggsave("my_awesome_plot.pdf", width = 6, height = 4)

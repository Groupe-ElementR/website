# =============================================================================#
#                           INITIATION AU LANGAGE R
#                 Séance 1 d'introduction : manipulation 
#
#   
# Auteur : JB, LC, AD pour le groupe ElementR
# date : décembre 2022
# =============================================================================#



# 1. Assignation/création d'objet ----

# R, s'il-te-plaît, calcule 21*2
21*2

# Création d'un objet avec assignation dans l'environnement
monObjet <- 21*2

# Attention, R est sensible à la casse
monobjet <- 21*2

# deux objets distincts ont été ajoutés dans mon environnement,
# pour afficher la liste de mes objets dans la console :
ls()

# Supprimer un objet de l'environnement :
rm(monobjet)

# Afficher mon objet dans la console :
monobjet # renvoie un message d'erreur : l'objet n'existe plus
monObjet

# Réutiliser le résultat stocké dans mon objet pour un nouveau calcul :
monObjet + 100

monObjet <- monObjet + 100

# Réutiliser le résultat stocké dans mon objet 
# pour un faire une chaîne de caractère :
paste0("Réponse : ", monObjet)

# Même chose mais en stockant le résultat dans un nouvel objet
monObjetAugmente <- paste0("Réponse : ", monObjet)

# Voir le résultat dans la console :
monObjetAugmente
# ou :
print(monObjetAugmente)

# Astuce : je veux voir le résultat dans la console en même temps que je créé l'objet :
rm(monObjetAugmente) # d'abord on supprime
(monObjetAugmente <- paste0("Réponse : ", monObjet))


# Clear environment
rm(monObjet, monObjetAugmente)



# 2. Trois types d'objets ----

## Vecteurs ----

# Vecteur de nombres
(vNum <- c(41.5, 38, 37))
class(vNum)

# vecteur de chaînes de caractères
vChar <- c("Joséphin", "Léa", "Aurélie")
class(vChar)

# vecteur de booléens
vBoo <- c(FALSE, TRUE, TRUE)
class(vBoo)


# Combinaison de vecteurs de données de différentes natures :
# numeric + character => character
(v <- c(vNum, vChar))
class(v)
# numeric + bolean => numeric
(v <- c(vNum, vBoo))
class(v)
# character + bolean => character
(v <- c(vBoo, vChar))
class(v)

rm(v)


## Facteurs ----

# Création d'un facteur 
f <- factor(c("homme", "homme", "femme", "femme", "femme", 
              "femme", "femme", "femme", "homme", "homme"))
class(f)

# Longueur de mon facteur (i.e. nombre d'éléments)
length(f)

# Niveaux de mon facteur (i.e. liste des modalités)
levels(f)

# Stockage interne d'un facteur
dput(f)


## conversion vecteur <--> facteur

# Convertir un facteur en character
f2v <- as.character(f)
class(f2v)

# Convertir un vecteur en facteur
v2f <- as.factor(f2v)
class(f2v)

# Convertir un vecteur numérique en character
as.numeric(c("1", "2", "3"))

# Convertir une série binaire en vecteur logique
as.logical(c(0, 1, 0, 0, 0, 0, 1, 1))


rm(f2v, v2f)


## Dataframe ----

(df <- data.frame(NOM = vChar, FEMME = vBoo, POINTURE = vNum))
View(df)




# 3. Indexation ----

## Indexation par position ----

### vecteur et facteur v[i]

## Exemple avec le vecteur letters fourni par R
letters

# je cherche le 1er élément du vecteur letters
letters[1]

# je cherche les éléments positionnés de 10 à 15
letters[c(10, 11, 12, 13, 14, 15)]
# ou, plus simplement
letters[10:15]

# sélection de lettres dans le désordre
letters[c(17:20, 1:3, 12, 15, 5)]

# je veux extraire les 3 dernières lettres de l'alphabet
letters[24:26]
# ou, si j'ignore le nombre de lettres dans l'alphabet :
tail(letters, 3)

# Les 3 premières avec head()
head(letters, 3)

# renvoie NA si sélection au-delà de la longueur du vecteur
letters[24:27]

# je veux tout sauf la 1ère lettre
letters[-1]

# je veux tout sauf certains éléments
letters[c(-1, -10, -17)]

# ça marche de la même manière avec un facteur
f[1]
f[-length(f)]

# je peux créer un nouvel objet à partir de ma sélection
abc <- letters[1:3]

# et ajouter une valeur à mon vecteur en utilisant l'indexation
abc[4] <- "d"
abcd <- c(abc, "d")

# remplacer des valeurs existantes
abc[1] <- "z"



### dataframe df[i, j] 
### exemples avec un df fourni par R :
iris

# je cherche la valeur de la première case : 
# je sélectionne la 1ère ligne
# et la 1ère colonne de mon df
iris[1,1]

# je veux extraire la 2eme ligne avec toutes les variables
iris[2, ]

# toutes les lignes de la 5eme colonne
iris[ ,5]
# ou de cette manière
iris[[5]]

# les deux dernières valeurs de la ligne 3
iris[3, 4:5]

# je peux créer un vecteur à partir d'une sélection de mon df
species <- iris[[5]]

# lui retirer des valeurs
length(species)
species <- species[-c(51:99)]
length(species)

# lui en ajouter
species[102:175] <- "chien" # renvoie une erreur : level inconnu dans ce facteur

# ajouter d'abord un nouveau level
levels(species) <- c(levels(species), "chien")
species[102:175] <- "chien"
species


## Indexation par condition ----

### une seule condition ----

# Création d'un nouveau vecteur numérique avec seq()
vNum <- seq(from=1, to=100, by=1)
# Quand le step de 1, on peut aussi écrire
1:100

# Sélection des valeurs supérieures à 51
vNum[vNum > 51]
# Sélection des valeurs égales ou supérieures à 51
vNum[vNum >= 51]

# Sélection des valeurs inférieures à 51
vNum[vNum < 51]
# Sélection des valeurs égales ou inférieures à 51
vNum[vNum <= 51]

# Sélection des valeurs égales à 25
vNum[vNum == 25]

# sélection des valeurs qui ne sont pas égales à 25
vNum[vNum != 25]

# sélection des valeurs qui sont présentes dans un autre vecteur
vNum[vNum %in% c(1, 19, 53, 31)]
# ou l'inverse
vNum[!vNum %in% c(1, 19, 53, 31)]


# Sélection dans un facteur :
species[species == "chien"]
species[species != "chien"]

# Sélection dans un vecteur character
letters[letters %in% c("a", "b", "c")]

# Gérer les valeurs manquantes
# on introduit d'abord des NA dans un vecteur
species[176:180] <- "chat"
# Recherche de NA : renvoie TRUE pour chaque élément manquant 
# FALSE pour chaque élément présent
is.na(species)
# On ne garde que les éléments avec une valeur 
#species[!is.na(species)]

# on créé un vecteur vide
vide <- c()
# renvoie TRUE si NULL
is.null(vide)



### double condition ----

# Avec & ou |

# On cherche les valeurs supérieures à 7 ET inférieures à 13 (exclus)
vNum[vNum > 7 & vNum < 13]
# On cherche les valeurs inférieures à 7 OU supérieures à 13 (exclus)
vNum[vNum < 7 | vNum > 13]


# On cherche les valeurs qui commencent par 9 ET qui sont pairs
vNum[(vNum %/% 10 == 9) & (vNum %% 2 == 0)] 
# On cherche les valeurs qui commencent par 9 OU qui sont pairs
vNum[(vNum %/% 10 == 9) | (vNum %% 2 == 0)] 
# avec un OU exclusif : ne renvoie pas 92, 94, 96 et 98
vNum[xor(vNum %/% 10 == 9, vNum %% 2 == 0)] 

# On cherche dans species tous les éléments 
# saufs les chiens ET les NAs
species[species != "chien" & !(is.na(species))]
# On cherche dans species les chiens OU les NAs
species[species == "chien" | is.na(species)]





## 4. Structure des données ----

# type 
class(species) 
# structure
str(df) 
# dimension 
dim(df)
# longueur 
length(vNum) 
# nombre de ligne d’un df
nrow(df)  
# nombre de colonnes d’un df
ncol(df)  
# le contenu d’un objet
print(vBoo)  
# affiche l’objet dans le volet "édition source"
View(vChar) 




## 5. Description des variables ----

# Sortir un rapide résumé stat d'une distribution 
summary(vNum) 

# Min et max
min(vNum)
max(vNum)

# valeurs centrales
median(vNum)
mean(vNum) 

# Attention aux NA !
vNumNA <- c(vNum, NA)
mean(vNumNA)
# -> Il faut spécifier qu'on n'en tient pas compte
mean(vNumNA, na.rm = TRUE)

# dispersion
sd(vNum) 
IQR(vNum) 

# par défaut, quartiles
quantile(vNum)

# déciles
quantile(vNum, probs = seq(from = 0, to = 1, by = 0.1 ))

# table de fréquence d'une variable discrète
table(species, useNA = "ifany")



## 6. Manipuler un dataframe ----

# Voir les 10 premières/dernières lignes de son tableau 
head(iris)
tail(iris)

# Sélectionner une ligne 
df[1,] # Première ligne, toutes les colonnes

# Sélectionner une colonne 
df[,1] # Toutes les lignes, première colonne

# Sélectionner une colonne avec les double crochets
df[[1]]

# Sélectionner une colonne par son nom 
df["NOM"]
df["POINTURE"]

# Sélectionner une valeur en particulier 
df[3,2] 

# Sélectionner plusieurs lignes avec c()
df[c(1,3),] 

# Sélectionner plusieurs lignes et colonnes avec c()
df[c(1, 2), c(2,3)]


# Pour ajouter une ligne à son tableau 
# Créer un vecteur de même longueur avec les mêmes types
nouveau <- list("Hugues", F, 45)
# L'ajouter à la suite de son tableau avec la fonction rbind (rowbind)
df <- rbind(df, nouveau)
df

# Pour ajouter une nouvelle colonne
# Créer un vecteur de même longueur, avec les mêmes types 
taille <- c(169, 168, 167, 180)
# La fonction cbind (columnbind) permet de lier les colonnes
df <- cbind(df, taille)

# On peut aussi directement ajouter ou modifier une colonne avec $ 
df$taille <- c(169, 167, 168, 180) # j'actualise les valeurs 

# La fonction row.names() indique le nom des lignes (par défaut, des numéros)
row.names(df)
# Ils sont affichés à gauche de la première colonne pendant la visualisation
df
# Créer une nouvelle colonne "id" grâce à la fonction row.names
df$id <- row.names(df)
df

# Pour manipuler le nom des colonnes, fonction names()
names(df) # affiche les noms 
# Pour changer les noms : sélectionne les colonnes voulues -> indique les nouvelles valeurs
names(df)[c(1, 4)] = c("PRENOM", "TAILLE")
df

# On peut faire des opérations entres les colonnes de même type
df$calcul <- df$TAILLE - df$POINTURE
df

# Ajouter du numérique à une colonne de type numérique
df$POINTURE <- df$POINTURE + 1
df

# Fonction order() pour trier son facilement un tableau
df <- df[order(df$TAILLE, decreasing = TRUE), ] # de la plus grande taille à la plus petite
df

# Supprimer une colonne rapidement avec la non-sélection
df <- df[,-6]
df

# Sélectionner et réorganiser son tableau 
df<-df[, c("id","PRENOM", "TAILLE")]
df


# Installer un package ----

#Solution 1
package_a_installer <- c('ggplot2', 'questionr', 'palmerpenguins')
install.packages(package_a_installer)

#Solution2
install.packages(c('ggplot2', 'questionr', 'palmerpenguins'))


#Execution de la ligne sans chargement du package donne une erreur
#ggplot(df) + geom_col(aes(x=NOM, y = POINTURE))


#Chargement des packages 

#Solution 1
library('ggplot2')
library('questionr')
library('palmerpenguins')

#Solution 2

lapply(c('ggplot2', 'questionr', 'palmerpenguins'), library, character.only = TRUE)



#Test d'une fonction de ggplot2
ggplot(df) + geom_col(aes(x=NOM, y = POINTURE))



#Trouver de l'aide sur un package 
?ggplot2




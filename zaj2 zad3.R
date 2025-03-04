#potrzebne zeby kod dzialal
install.packages("rJava")
install.packages("qdap")
library(rJava)
library(qdap)
library(RColorBrewer)

# Tworzenie chmury słów za pomocą pakietu wordcloud
install.packages("wordcloud",encoding = "UTF-8")
library(wordcloud)

# Wczytaj dane tekstowe
# Wczytanie pliku tekstowego z lokalnego dysku
text <- readLines(file.choose())
text

#Obliczanie, usuniecie stopslow i prezentacja na wykresie
frequent_terms <- freq_terms(text)
frequent_terms
frequent_terms <- freq_terms(text, stopwords = Top200Words)
plot(frequent_terms)

# Opcje chmury słów
?wordcloud
# Zmiana wartości min.freq i max.words w celu wyświetlenia mniejszej/większej liczby słów.
# min.freq: słowa o częstości poniżej tej wartości nie będą wyświetlane
# max.words: maksymalna liczba słów do wyświetlenia

# Utwórz chmurę słów
wordcloud(frequent_terms$WORD, frequent_terms$FREQ)

# Ograniczenie liczby słów w chmurze poprzez określenie minimalnej częstości
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4)

# Ograniczenie liczby słów w chmurze poprzez określenie maksymalnej liczby słów
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, max.words = 5)

# Opcje palety
?wordcloud
?brewer.pal
brewer.pal.info

# Optymalizacja i dostosowanie wyników
# Dodanie koloru do chmury słów dla lepszej wizualizacji
# Dodanie koloru
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(8, "Dark2"))
# Dodanie koloru
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, max.words = 5, colors = brewer.pal(8, "Accent"))


# Dodanie różnych palet kolorystycznych
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9, "Blues"))
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9, "Reds"))
wordcloud(frequent_terms$WORD, frequent_terms$FREQ, min.freq = 4, colors = brewer.pal(9, "Greens"))

# W  obu przemówieniach często wystepuje tax
# W przemowieniu z 2021 wsrod najczestszych wystepuja slowa związane z rodziną i pracą (jobs, families, care, child)
# W przemowieniu z 2024 wystepuja glownie slowa związane z pieniędzmi i przyszłością (pay, tax, bill, milion)
# mozemy na podstawie powyzszej analizy zauwazyc zmiane priorytetow 

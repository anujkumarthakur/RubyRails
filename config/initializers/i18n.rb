#The first thing it does is use the I18n module to set the default locale. 
#I18n is a funny name, but it sure beats typing out internationalization all 
#the time. Internationalization, after all, starts with an i, ends with an n, 
#and has eighteen letters in between.

#encoding: utf-8
I18n.default_locale = :en
LANGUAGES = [
    ['English', 'en'],
    ["Espa&ntilde;ol".html_safe, 'es']
]

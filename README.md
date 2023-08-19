# Rick_and_Morty
Всем тестовое задание за мой счет :)

# Описание
Здравствуйте! Спасибо за то, что проявили внимание к моему тестовому заданию! 
Приложение представляет собой клиент для просмотра информации о персонажах сериала "Рик и Морти". В качестве API был использован https://rickandmortyapi.com/

## Стэк 
Приложение реализовано без сторонних библиотек. Только нативщина, только хардкор :). Для работы с многопоточность был использован GCD ( DispathcQueue.main; DispatchGroup для запроса эпизодов сериала ). 
Для индикации загрузки вместо стандартных loader я решил использовать shimmer animation, чтобы вы могли оценить мои навыки в Core Animation и потому что таков путь самурая...
Архитектура приложения - слоеная ( или слоевая? короче - layered ). UI-слой был реализован при помощи VIPER+Coordinator. Coordinator в данном случае может показаться overengeneering, но я очень люблю этот паттерн :) Да и приложение в будущем может случайно вырасти...

# Что предстоит реализовать 
- Кэширование. Было бы славно кэшировать результаты запроса на персонажей и информацию о просмотренных персонажах. Для кэширования подойдет Core Data, так как предполагается наличие связи "один к одному" - персонаж и информация о нем.

# Демонстрация работы приложения: 

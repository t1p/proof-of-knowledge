# Описание сущностей для смарт контракта
Данные для транзакции в смарт контракт.

## Контракты с валидатором

### Создание сообщества валидаторов
1. Инициатор сообщества - публичный ключ
1. Название сообщества - поле text 256?
1. Область валидации - имена из классификатора OpenData
1. Ссылка (+хеш) на описание и вступление в сообщества в ipfs
1. Залог за присоединение к сообществу - сумма 5 у.е.
1. Залог за создание сообщества - сумма 25 у.е.
1. Токен - Название / тикет

Дополнительно Инициатор в момент создания (может быть изменено голосованием в будущем) принимает два обязательных решения (отдельными транзакциями):
#### Параметры голосования:
1. Длительность голосования - часы дни и тд.
1. Требуемый Кворум (от 100 до 0%, т.е. даже без голосования)

#### Критерии истиности / правила валидации / методика
1. Ссылка на методику - url ipfs
1. Стоимость валидации (минимальной) - N токенов сети
1. Минимальное колво участников валидации (def 3)
1. Время реакции на предложение (def 24 h)

**Результат** - сообщество (ДАО) создано. Задеплоен контракт сообщества. В нем видно кто создал и его свойства. В базу сообществ отправлен УИД и область.

### Вступление в сообщество валидаторов
1. УИД сообщества - ИД смарт контракта сообщества
2. Кандидат - публичный ключ
3. Залог - N токенов сети
4. Пользовательские данные (пример: имя кандидата, ссылка на профиль соц сетей, документ, etc)

**Результат** - Кандидат стал участником сообщества. В блокчейне есть запись о новом участнике.

### Предложение голосования участником
Как для изменения обязательных решений. Так и для добавления новых .

1. Участник - публичный ключ
1. Ссылка на описание предложения  - url ipfs
1. Ссылка (опция) на предыдущее голосование - УИД голосования. Если выбрана то указываются, действие (изменить, удалить) и новые атрибуты предлагаемого решения

**Результат** - Предложение в блокчейне со статусом "на голосовании". Участники могут голосовать. Если набран кворум, голосование останавливаетмя до окончания срока. Статус "принято". Если кворум набран не был, то статус не "принято". Если принятое решение затрагивает принятое ранее решение, то прошлая версия статус "не действует", новая "действует" с измененными атрибутами.

## Контракты с пользователем
### Предложение на валидацию

1. Пользователь - публичный ключ
1. Ссылка с данными на валидацию - url ipfs
1. Предлагаемая цена валидации (он же залог за валидацию) - N токенов сети
1. Параметры валидации (срок, кол-во валидаторов, etc)

**Результат** - участники получают оповещение о заявке на валидацию (в метамаске или др).

### Согласие валидировать Предложение
1. Участник - публичный ключ
1. Залог за валидацию - N токенов сети
1. Условия приняты - факт транзакции

**Результат** - При достижении минимального кол-во участников, участники могут отправлять в блокчейн свои решения по валидации.

### Результат валидации предложения
1. Участник - публичный ключ
1. Решение - валид, не валид, не применимо (скрыто от паблика)
1. Ссылка на протокол валидации (опция) - url ipfs

**Результат** - При получении результатов от всех валидаторов, сеть сравнивает их результат. Если 2/3 валидаторов дали одинаковое решение, сеть генерит по 3 х N токенов валидаторам, и 1,5 х N пользователю. Также заносит +1 в поле репутации валидаторов и +1 пользователю успешные валидации. Также присваивается "+1 валид" информации по данному адресу и она кешируется в ipfs нодах сети. Если 2/3 валидаторов дали различные решения, то залоги не возвращаются. В неуспешные валидации валидаторам и пользователю -1.

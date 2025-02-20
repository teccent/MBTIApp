## Как происходит загрузка данных
### 1. NetworkManager
Класс NetworkManager отвечает за выполнение сетевых запросов.

Основные функции

**fetchTestData(completion:)** – создает новый тест и возвращает его testId и testUrl.
1.	Отправляется GET-запрос к API.
2.	Сервер возвращает JSON с testId и testUrl.
3.	JSON декодируется в TestData.
4.	completion(.success(testData)) передает testData (новый тест) в TestLink.

**fetchData(testId:completion:)** – загружает результат теста по testId.
1.	Отправляется запрос к API с testId.
2.	Сервер возвращает результат теста.
3.	JSON декодируется в MBTIModel.
4.	completion(.success(response.data)) передает результат в TestViewModel.

### 2. TestViewModel
Этот класс управляет получением и обработкой данных.

**fetchResults:** - Запрашивает данные о тесте
1. Принимает testId и передает его в NetworkManager.fetchData().
2. Если запрос успешный, передает prediction в TestView.
   
**loadResult:** - Обновляет AppState
1. Получает результат и добавляет его в appState.predictions.

### 3. TestView
Этот экран показывает список результатов тестов.

**ScrollView** - Список результатов
1. Показывает все пройденные тесты.
2. При каждом возврате в TestView список обновляется.

**NavigationLink** - Переход в TestLink
1. Открывает TestLink.
2. После возвращения из TestLink, вызывает loadResult(testId:), чтобы загрузить результаты.

### 4. TestLink
Этот экран показывает веб-страницу с тестом.

**.onAppear** - Запрос на создание нового теста
1. onAppear вызывается при каждом входе на TestLink.
2. fetchTestData() создает новый testId и testUrl.

**fetchTestData** - Получает новый тест
1. Запрашивает новый testId и testUrl из NetworkManager.fetchTestData().
2. Сохраняет их в appState.

## Передача данных между компонентами
**1.	TestView → TestLink**

При переходе в TestLink вызывается fetchTestData(), который создает новый testId.

**3.	TestLink → TestView**

После прохождения теста, при возврате в TestView, вызывается loadResult(testId:), который запрашивает результат теста и добавляет его в appState.predictions.

**4.	Обновление интерфейса**

@StateObject в TestView следит за изменениями в appState.
Как только appState.predictions обновляется, список результатов автоматически обновляется.



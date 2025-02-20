- [Описание](#--------)
  * [1. ContentView](#1-contentview)
  * [2. GenerateView](#2-generateview)
  * [3. GenerateViewModel](#3-generateviewmodel)
  * [4. DetailView](#4-detailview-------------------------)
  * [5. FAQView](#5-faqview)
  * [6. DataManager](#6-datamanager)
  * [7. WebManager](#7-webmanager)
  * [8. Модели данных для API](#8-------------------api--mbtimodel--mbtiresponse--apiresponse-)
- [Как происходит загрузка данных](#------------------------------)
  * [1. NetworkManager](#1-networkmanager)
  * [2. TestViewModel](#2-testviewmodel)
  * [3. TestView](#3-testview)
  * [4. TestLink](#4-testlink)
  * [Передача данных между компонентами](#----------------------------------)

## Описание
### 1. ContentView
Отвечает за отображение трёх основных вкладок:

•	GenerateView — для генерации MBTI типа.

•	TestView — для прохождения тестов.

•	FAQView — для информации о MBTI.

•	Использует TabView с иконками и подписями.

### 2. GenerateView

•	Отображает 4 Picker, каждый из которых выбирает одну из букв MBTI (например, E/I, S/N).

•	Кнопка “Generate type” создает комбинацию выбранных букв и ищет описание через GenerateViewModel.

•	Показывает модальное окно (DetailView) с описанием выбранного типа.

### 3. GenerateViewModel

•	Хранит возможные буквы MBTI и описания типов из DataManager.

•	Следит за состоянием выбранного описания типа.

### 4. DetailView

•	Показывает сгенерированный MBTI код и описание выбранного типа.

•	Использует @Binding для связи с родительским вью.

### 5. FAQView 

•	Заготовка для текста о системе MBTI.

•	Использует ScrollView для отображения длинного текста.

### 6. DataManager

•	Хранит словарь с описаниями типов MBTI.

### 7. WebManager

•	Отвечает за отображение веб-страницы через WKWebView.

### 8. Модели данных для API (MBTIModel, MBTIResponse, ApiResponse)

•	Структуры для парсинга данных из JSON-ответов от сервера.

•	Четко разделены на мета-информацию (Meta) и данные теста (DataResponse).

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



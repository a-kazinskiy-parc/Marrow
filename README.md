# Marrow

## Описание

**Marrow** – фреймворк-оболочка над backbone.js для упрощения работы с компонентами и упрощения реализации концепции *MVVM*

# Описание модификаций backbone.js
## Backbone.View

###__bundleName `view.__bundleName`
---
Внутренняя переменная в которой хранится имя бандла к которому слинкованая данная вью. Необходимо для вызова метода `view.unload()`.

###__super `view.__super`
---
Внутренняя переменная в которой хранится ссылка на объект `Core`. Необходим для вызова метода `view.unload()`.

###beforeUnload `view.beforeUnload()`
---
Метод, который всегда вызывается во время выгрузки вью (вызов метода `Core.unload()`) перед вызовом метода `view.remove()`. Нужен для отписывания обработчиков, используемых в текущей вью, от глобальных событий, изменение стилей и прочая подготовка к удалению вью.

###unload `view.unload()`
---
Метод, который делает выгрузку вью удаляя ее инстанс из бандла к которому она слинкована. 
Цепочка методов выполняемых при вызове метода `view.unload()`:

1. `view.beforeUnload()`;
2. `view.remove()`;
3. `Core.unload(view.__bundleName)`.

## Backbone.Model

###send `model.send(attrs, options)`
---
Вызывает запрос POST методом с передачей параметров, который передает только указанные параметры **attrs** не объединяя их с данными модели.

###read `model.read(attrs, options)`
---
Вызывает запрос GET методом с передачей параметров, который передает только указанные параметры **attrs** не объединяя их с данными модели.

# Описание методов Core.js

###links `Core.links([aliasName[, link]])`
---

Метод, который регистрирует и возвращает псевдонимы **aliasName** в которых указанны ссылки на переданные объекты **link**.
	
	Core.links(); // Получение коллекции всех ссылок. Имеет аналог в виде Core.aliases
	
	Core.links('aliasName'); // Получение ссылки зарегистрированной по передаваемому псвдониму.
	
	Core.links('aliasName', link); // Регистрация ссылки на объект/переменную/фукцию под переданным псевдонимом
	
###getHashUrl `Core.getHashUrl()`
---
Метод возвращает объект с данными о текущем активном роуте. В ответе возвращается объект с двумя ключами **section** и **parameters**.

	{
		section: 'routeName',
		parameters: 'string of additional params'
	}

###Observatory `Core.Observatory`
---
Пустой `jQuery` объект созданый для обслуживания глобальной событийной модели приложения.

	Core.Observatory.trigger('event_name', [argument1, argument2]) // Выстреливает глобальное событие event_name и передает в обработчик два аргумента;
	
	// Создание обработчика на глобальное событие event_name, который принимает в качестве аргументов объект jQuery события и два аргумента переданные при выстреливании события
	Core.Observatory.bind('event_name', function(event, argument1, argument2) {
		...
	});

###DateUTC `Core.DateUTC([time, format, asArray])`
---
Метод для работы с датой.

###requestWraper `Core.requestWraper(target, method, data[, params])`
---
Метод оболочка реализующий 

###abortRequest `Core.abortRequest(id)`
---
...

###defferedViewRender `Core.defferedViewRender(renderHandler, dataSourceHandler[, params])`
---
...

###navigate `Core.navigate(hash[, triggerRoute])`
---
...

###toArray `Core.toArray(object)`
---
Метод, который преобразует объект в массив. В массив добавляется элемент формата:

	{
		name: key,
		value: object[key]
	}
	
Если будет передан массив, то он веренется без изменения.

###toObject `Core.toObject(array)`
---
Метод, который преобразует массив в объект. Массив должен приходить формата:

	[{
		name: 'a',
		value: 1
	},{
		name: 'b',
		value: 2
	}]
	
На выходе получим:

	{
		a: 1,
		b: 2
	}

Если будет передан объект, то он вернется без обработки.

###goToPage `Core.goToPage(url[, isForceLoad])`
---
...

###cookie `Core.cookie(params)`
---
...

###getCacheReset `Core.getCacheReset()`
---
...

###list `Core.list`
---
...

###locationBlock `Core.locationBlock`
---
...

###createEventProxy `Core.createEventProxy(dataSource)`
---
...

###set `Core.set(name[, params, render])`
---
...

###render `Core.render(name[, params])`
---
...

###renderStream `Core.renderStream(bundlesList[, params])`
---
...

###get `Core.get([bundleName])`
---
...

###unload `Core.unload(bundleName)`
---
...

###restore `Core.restore()`
---
...

# Описание структуры репозитория

**/src** – в данной папке находятся основные файлы фреймворка с минимальным набором логики необходимой для разворачивания нового веб-приложения (эти же файлы дублируются и находятся в папке **/files/static/js**)

**/files** – в этой папке находится файловая структура к который мы пришли в использовании на проектах

**/files/static** – папка в которой располагается весь статический контент используемы в веб-приложении

**/files/static/html** – в этой папке находятся файлы необходимы для работы с *iframe proxy* используемый для кроссдоменных запросах *(подробное описание ниже)*

**/files/static/swf** – в данной папке ...

**/files/static/js** – папка в которой находятся все скрипты используемый в веб-приложении сгрупированные по папкам

**/files/static/js/libs** – в данной папке хранятся стороние библиотеки которые необходимы для полноценного функционирования веб-приложения

**/files/static/js/routes** – в данной папке хранятся файлы реализующие роутинг приложения и отвечающие за создание бандлов (связка вью с ее вью-моделью)

**/files/static/js/collections** – в данной папке хранятся файлы реализующие коллекции

**/files/static/js/models** – в данной папке хранятся файлы реализующие модели и вью-модели

**/files/static/js/views** – в данной папке хранятся файлы реализующие вью

## Описание файлов

*в процессе написания...*

## Описание процесса инициализации веб-приложения

*в процессе написания...*

## Описание работы с *iframe proxy*

*в процессе написания...*

## 

#### TODO: 

1. Описание в разделах;
2. Полное коментирование кода.
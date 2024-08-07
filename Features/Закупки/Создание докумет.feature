﻿#language: ru



Функционал: создание документа Поступления товаров 

Как Менджер по закупкам я хочу
создание документа поступления товаров 
чтобы поставить товар на учет

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание документа поступления товаров
// создание документа проведения
*  Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Закупки" "Поступления товаров"
	Тогда открылось окно "Поступления товаров"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Поступление товара (создание)"
* Заполнение шапки документа 
	И я нажимаю на кнопку открытия поля с именем 'Организация'
	И из выпадающего списка с именем 'Организация' я выбираю точное значение 'ООО "Товары"'
	И из выпадающего списка с именем 'Склад' я выбираю точное значение "Большой"
	Тогда элемент формы с именем 'Склад' стал равен "Большой"
	И из выпадающего списка с именем 'Валюта' я выбираю точное значение "Рубли"
	И я нажимаю кнопку выбора у поля с именем 'Поставщик'
	Тогда открылось окно "Контрагенты"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000006" | "Пантера АО"   |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Поступление товара (создание) *"
* Заполнение товарной части
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу на один уровень вниз
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000025" | "Пинетки"      |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Поступление товара (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "5,00"
	И в таблице 'Товары' я завершаю редактирование строки
	* Проверка заполнения табличной части
		Тогда таблица 'Товары' содержит строки:
			| 'N' | 'Товар'   | 'Артикул' | 'Цена'     | 'Количество' | 'Сумма'    |
			| '1' | 'Пинетки' | 'Pin23'   | '1 000,00' | '5,00'       | '5 000,00' |	
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна "Поступление товара (создание) *" в течение 20 секунд
* Проверка создания документа
	И таблица 'Список' содержит строки:
		| 'Номер' |
		| '$Номер$'|
Сценарий: проверка наличия в справочнике номенклатуры пинетки
	И В командном интерфейсе я выбираю "Продажи" "Товары"
	Тогда открылось окно "Товары"
	И я нажимаю на кнопку с именем 'ФормаСписок'
* Проверка создания документа
	И таблица 'Список' содержит строки:
		| 'Наименование' |
		| 'Пинетки'|
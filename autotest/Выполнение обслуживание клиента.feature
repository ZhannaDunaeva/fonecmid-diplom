﻿#language: ru

@tree

Функционал: Закрытие обслуживаний от имени Специалиста
  

Как Специалист
Я хочу закрывать назначенные мне обслуживания
Чтобы фиксировать выполненную работу

Контекст:
	И я закрываю TestClient "Менеджер"
	И я подключаю TestClient "Специалист" логин "Специалист" пароль ""
	И я закрываю все окна клиентского приложения
	
Структура сценария: Проведение документа Обслуживание клиента
* Для каждого назначенного обслуживания
    * Я открываю документ для выполнения
		И В командном интерфейсе я выбираю "Обслуживание клиентов" "Обслуживание клиента"
		Тогда открылось окно "Обслуживание клиента"
	* Я открываю документ
		Когда открылось окно "Обслуживание клиента"
		И в таблице 'Список' я перехожу к строке:
		| "Номер" | "Дата"           |
		| "*"     | "[ДатаСоздания]" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Обслуживание клиента * от *"
	* Я заполняю фактические данные
		И в таблице 'ВыполненныеРаботы' я нажимаю на кнопку с именем 'ВыполненныеРаботыДобавить'
		И в таблице 'ВыполненныеРаботы' в поле с именем 'ВыполненныеРаботыОписаниеРабот' я ввожу текст '[ЗначОписание]'
		И в таблице 'ВыполненныеРаботы' я активизирую поле с именем 'ВыполненныеРаботыФактическиПотраченоЧасов'
		И в таблице 'ВыполненныеРаботы' в поле с именем 'ВыполненныеРаботыФактическиПотраченоЧасов' я ввожу текст '[ЗначЧасы]'
		И в таблице 'ВыполненныеРаботы' я активизирую поле с именем 'ВыполненныеРаботыЧасыКОплатеКлиенту'
		И в таблице 'ВыполненныеРаботы' в поле с именем 'ВыполненныеРаботыЧасыКОплатеКлиенту' я ввожу текст '[ЗначЧасы]'
		И в таблице 'ВыполненныеРаботы' я завершаю редактирование строки
	* Я провожу документ
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна "Обслуживание клиента * от * *" в течение 5 секунд
Примеры:
| ДатаСоздания        | ЗначЧасы | ВремяОкончания | ЗначОписание                 |
| 04.07.2025 9:46:55  | 5,00     | 15:00:00       | Настроить регистры           |
| 04.07.2025 9:38:21  | 3,00     | 12:00:00       | настройка кластеров серверов |
| 18.06.2025 20:52:55 | 8,00     | 12:00:00       | Обновление конфигурации      |
| 10.06.2025 15:19:08 | 3,00     | 18:00:00       | Введение новых пользователей |


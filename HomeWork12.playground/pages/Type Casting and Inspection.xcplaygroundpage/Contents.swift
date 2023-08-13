/*:
 ## Упражнение - приведение типов и их контроль

 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */
let collectionAny: [Any] = [1, 4, "Hello", true, 2.3, "L", 2, 2.9, "A", false]
print(collectionAny)
/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */
for item in collectionAny {
    if item is Int {
        print("Это целое число - \(item)")
    } else if item is Bool {
        print("Это булевое значение - \(item)")
    } else if item is Double {
        print("Это вещественное число - \(item)")
    } else if item is String {
        print("Это строковое значение - \(item)")
    }
}

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите крассиво на консоль пары ключ/значения для всех элементов коллекции.
 */
print("-------------------------------------------------------")
let dictionaryStringAny: [String: Any] = ["A": 1, "B": 2.2, "C": false, "D": "12.j2", "E": 2, "F": "2", "G": "Hello"]

for (key, value) in dictionaryStringAny {
    print(" Ключ: \(key) - Значение: \(value)")
}

/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
var total: Double = 0
print("-------------------------------------------------------")
for (_, value) in dictionaryStringAny {
    if let int = value as? Int {
        total += Double(int)
    } else if let bl = value as? Bool {
        if bl {
            total += 2.0
        } else { total -= 3.0 }
    } else if let db = value as? Double {
        total += db
    } else if let str = value as? String {
        total += 1
    }
}

print("Значение total = \(total)")

/// *:
// Обнулите переменную `total` и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
// */
print("-------------------------------------------------------")
total = 0
for (_, value) in dictionaryStringAny {
    if let int = value as? Int {
        total += Double(int)
    } else if let db = value as? Double {
        total += db
    } else if let str = value as? String {
        if Double(str) is Double {
            total += Double(str) ?? 0
        } else {
            print("Преобразование '\(str)' невозможно!!!")
        }
    }
}

print("Результат = \(total)")

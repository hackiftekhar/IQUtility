//
//  Date+Extension.swift
//  https://github.com/hackiftekhar/IQUtility
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

extension Date {

    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }

    @available(iOS 10.0, *)
    var startOfMonth: Date {
        let interval = Calendar.current.dateInterval(of: .month, for: self)!
        return interval.start
    }

    @available(iOS 10.0, *)
    var endOfMonth: Date {
        let interval = Calendar.current.dateInterval(of: .month, for: self)!
        return Calendar.current.date(byAdding: DateComponents(day: -1), to: interval.end)!
    }
}

extension Date {
    func isGreaterThan(date: Date) -> Bool {
        self.compare(date) == .orderedDescending
    }

    func isLessThan(date: Date) -> Bool {
        self.compare(date) == .orderedAscending
    }

    func equalTo(date: NSDate) -> Bool {
        self.compare(date as Date) == .orderedSame
    }
}

extension Date {

    var second: Int {
        Calendar.current.component(.second, from: self)
    }

    var minute: Int {
        Calendar.current.component(.minute, from: self)
    }

    var hour: Int {
        Calendar.current.component(.hour, from: self)
    }

    var day: Int {
        Calendar.current.component(.day, from: self)
    }

    var weekday: Int {
        Calendar.current.component(.weekday, from: self)
    }

    var month: Int {
        Calendar.current.component(.month, from: self)
    }

    var year: Int {
        Calendar.current.component(.year, from: self)
    }
}

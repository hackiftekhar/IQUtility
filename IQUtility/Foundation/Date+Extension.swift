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

public extension Date {

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
        return Calendar.current.date(byAdding: DateComponents(second: -1), to: interval.end)!
    }

    @available(iOS 10.0, *)
    var startOfWeek: Date {
        let interval = Calendar.current.dateInterval(of: .weekOfYear, for: self)!
        return interval.start
    }

    @available(iOS 10.0, *)
    var endOfWeek: Date {
        let interval = Calendar.current.dateInterval(of: .weekOfYear, for: self)!
        return Calendar.current.date(byAdding: DateComponents(second: -1), to: interval.end)!
    }
}

public extension Date {
    func isGreaterThan(date: Date) -> Bool {
        self.compare(date) == .orderedDescending
    }

    func isLessThan(date: Date) -> Bool {
        self.compare(date) == .orderedAscending
    }

    func equalTo(date: Date) -> Bool {
        self.compare(date) == .orderedSame
    }
}

public extension Date {

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

public extension Date {

    func adding(component: Calendar.Component, value: Int) -> Date {
        return Calendar.current.date(byAdding: component, value: value, to: self)!
    }

//    func timeAgoDisplay() -> String {
//        let calendar = Calendar.current
//        let minuteAgo = calendar.date(byAdding: .minute, value: -1, to: Date())!
//        let hourAgo = calendar.date(byAdding: .hour, value: -1, to: Date())!
//        let dayAgo = calendar.date(byAdding: .day, value: -1, to: Date())!
//        let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
//        if minuteAgo < self {
//            let diff = Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
//            return "\(diff) sec ago"
//        } else if hourAgo < self {
//            let diff = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
//            return "\(diff) min ago"
//        } else if dayAgo < self {
//            let diff = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
//            return "\(diff) hrs ago"
//        } else if weekAgo < self {
//            let diff = Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
//            return "\(diff) days ago"
//        } else if self > minuteAgo {
//            return "just now"
//        }
//        //let diff = Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
//        //  return "\(diff) weeks ago"
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd-MMM-yyyy"
//        let dateString = formatter.string(from: self)
//        return dateString
//    }
}

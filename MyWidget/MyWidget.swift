//
//  MyWidget.swift
//  MyWidget
//
//  Created by Engin Kurutepe on 10.07.20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry

    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
}

struct PlaceholderView : View {
    var body: some View {
        Text("Placeholder View")
    }
}

struct MyWidgetEntryView : View {
    var entry: Provider.Entry
    let mediumDinFont = Font.custom("AlteDIN1451Mittelschrift", size: 20, relativeTo: .headline)
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
            }
            HStack(spacing: 10) {
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
            }
            HStack(spacing: 10) {
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
            }
            HStack(spacing: 10) {
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
            }
            HStack(spacing: 10) {
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
                Text(entry.date, style: .time).font(mediumDinFont)
            }
        }
    }
}

@main
struct MyWidget: Widget {
    private let kind: String = "MyWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            MyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct MyWidget_Previews: PreviewProvider {
    static var previews: some View {
        MyWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}

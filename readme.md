# LocalNotificationPattern

UILocalNotification Pattern & Test Pattern

For details, please see the fllowing page:

* [UILocalNotificationを使った通知の設定について — ios-practice 0.1 documentation](https://ios-practice.readthedocs.org/en/latest/docs/notification/ "UILocalNotificationを使った通知の設定について — ios-practice 0.1 documentation")

## Structure

``LocalNotificationManager``
: ``UILocalNotification`` manager class.

``ExampleScheduleDataSource``
: DataSource class for ``LocalNotificationManager``.

``AppDelegate``
: call ``LocalNotificationManager`` here.

### Testing

``LocalNotificationMangerTest``
: Test Class & Spy ``LocalNotificationManager``

ref. [Intro to Objective-C TDD [Screencast] - Quality Coding](http://qualitycoding.org/objective-c-tdd/ "Intro to Objective-C TDD [Screencast] - Quality Coding")


## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT

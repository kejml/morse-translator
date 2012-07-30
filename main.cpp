#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QTranslator> // include QTranslator
#include <QLocale> // include QLocale
#include "torch.h"
#include <QtDeclarative>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QLocale  locale; // A locale instance

    // Load .qm translation file of the language currently set in system settings
    QTranslator translator;
    translator.load(QString("i18n/morse_") + locale.name().split('_').first(),":/");

    app->installTranslator(&translator);

    qmlRegisterType<torch, 1>("Torch", 1, 0, "Torch");

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/morse/main.qml"));
    viewer.showExpanded();

    return app->exec();
}

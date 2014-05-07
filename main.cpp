/***************************************************************************

    Copyright (C) 2012-2014, Kejml <kejml@kejml.eu>
    All Rights Reserved.

    This file is part of Morse Translator.

    Morse Translator is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Morse Translator is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Morse Translator. If not, see <http://www.gnu.org/licenses/>.

 ***************************************************************************/

#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QTranslator> // include QTranslator
#include <QLocale> // include QLocale

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QLocale  locale; // A locale instance

    // Load .qm translation file of the language currently set in system settings
    QTranslator translator;
    translator.load(QString("i18n/morse_") + locale.name().split('_').first(),":/");

    app->installTranslator(&translator);

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/morse/main.qml"));
    viewer.showExpanded();

    return app->exec();
}

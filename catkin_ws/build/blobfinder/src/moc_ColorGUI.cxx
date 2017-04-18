/****************************************************************************
** Meta object code from reading C++ file 'ColorGUI.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.7)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/blobfinder/src/ColorGUI.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ColorGUI.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.7. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ColorGUI[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      17,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      10,    9,    9,    9, 0x0a,
      26,   17,    9,    9, 0x0a,
      40,    9,    9,    9, 0x0a,
      47,    9,    9,    9, 0x0a,
      56,    9,    9,    9, 0x0a,
      66,    9,    9,    9, 0x08,
      78,    9,    9,    9, 0x08,
      93,    9,    9,    9, 0x08,
     111,    9,    9,    9, 0x08,
     129,    9,    9,    9, 0x08,
     148,    9,    9,    9, 0x08,
     155,    9,    9,    9, 0x08,
     162,    9,    9,    9, 0x08,
     175,    9,    9,    9, 0x08,
     192,    9,    9,    9, 0x08,
     208,    9,    9,    9, 0x08,
     222,    9,    9,    9, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_ColorGUI[] = {
    "ColorGUI\0\0load()\0filename\0load(QString)\0"
    "save()\0saveAs()\0fileNew()\0handleROS()\0"
    "onAddClicked()\0onRemoveClicked()\0"
    "onRenameClicked()\0onCurrentChanged()\0"
    "undo()\0redo()\0freezeUndo()\0repopulateList()\0"
    "updateActions()\0updateFocus()\0"
    "updateView()\0"
};

void ColorGUI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ColorGUI *_t = static_cast<ColorGUI *>(_o);
        switch (_id) {
        case 0: _t->load(); break;
        case 1: _t->load((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->save(); break;
        case 3: _t->saveAs(); break;
        case 4: _t->fileNew(); break;
        case 5: _t->handleROS(); break;
        case 6: _t->onAddClicked(); break;
        case 7: _t->onRemoveClicked(); break;
        case 8: _t->onRenameClicked(); break;
        case 9: _t->onCurrentChanged(); break;
        case 10: _t->undo(); break;
        case 11: _t->redo(); break;
        case 12: _t->freezeUndo(); break;
        case 13: _t->repopulateList(); break;
        case 14: _t->updateActions(); break;
        case 15: _t->updateFocus(); break;
        case 16: _t->updateView(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ColorGUI::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ColorGUI::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_ColorGUI,
      qt_meta_data_ColorGUI, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ColorGUI::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ColorGUI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ColorGUI::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ColorGUI))
        return static_cast<void*>(const_cast< ColorGUI*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int ColorGUI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 17)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 17;
    }
    return _id;
}
QT_END_MOC_NAMESPACE

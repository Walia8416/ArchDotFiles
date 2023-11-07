import 'react-native-gesture-handler';

import App from './src/App';
import {AppRegistry} from 'react-native';
import {Provider} from 'react-redux';
/**
 * @format
 */
import React from 'react';
import {name as appName} from './app.json';
// redux store
import {PersistGate} from 'redux-persist/integration/react';
import {store, persistor} from './src/store/store';

export const Root = () => (
  <Provider store={store}>
    <PersistGate persistor={persistor} loading={null}>
      <App />
    </PersistGate>
  </Provider>
);

AppRegistry.registerComponent(appName, () => Root);

export ANDROID_SDK_ROOT=$HOME/android/sdk
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/tools/bin/:$PATH
export PATH=$ANDROID_SDK_ROOT/emulator/:$PATH
export PATH=$ANDROID_SDK_ROOT/platform-tools/:$PATH
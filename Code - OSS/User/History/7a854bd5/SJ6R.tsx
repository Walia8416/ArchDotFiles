import {View, Text} from 'react-native';
import React from 'react';
import {RouteStackParamList} from '../../../Routes';
import AsyncStorage from '@react-native-async-storage/async-storage';
import styles from './SplashScreens';
import ImageContainer from '../../helpers/header/ImageContainer';
import Images from '../../../constants/icon';
import {RFValue} from 'react-native-responsive-fontsize';
import {
  Bold,
  ExtraBold,
  RobMono,
  SemiBoldItalic,
} from '../../../constants/Fonts';
import {Colors} from '../../../constants/colors';
import {useAppSelector} from '../../../store/store';
import {useDispatch} from 'react-redux';
import {getStores} from '../../../store/actions/stores';
import {getorders} from '../../../store/actions/getOrders';

const SplashScreen: React.FC<RouteStackParamList<'SplashScreen'>> = ({
  navigation,
  route,
}: RouteStackParamList<'SplashScreen'>) => {
  const dispatch = useDispatch();
  React.useEffect(() => {
    setTimeout(() => {
      navigation.navigate('Home');
    }, 50);
  });

  
  return (
    <View style={styles.screen}>
      <View style={styles.subsection}>
        
      </View>
    </View>
  );
};
export default SplashScreen;

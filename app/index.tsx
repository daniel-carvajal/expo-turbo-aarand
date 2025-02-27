import React from 'react';
import { useState } from 'react';
import { View, SafeAreaView, StatusBar, Text, Button } from 'react-native';
import RTNAarand from 'rtn-aarand/js/NativeRTNAarand';

const App = () => {
  const [result, setResult] = React.useState<string | null>(null);

  const handlePress = async () => {
    if (RTNAarand) {
      const res = await RTNAarand.performAarandLogic();
      setResult(res);
    }
  };

  return (
    <SafeAreaView>
      <Button title="Perform Aarand Logic" onPress={handlePress} />
      {result && <Text>{result}</Text>}
    </SafeAreaView>
  );
};

export default App;
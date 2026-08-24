import { useEffect, useState } from "react";
import axios from "axios";



const URL_API_DB_PREDICTION = "http://localhost:5000/db_prediction";



const dict_sample = {
    "gender": "Female",
    "age": 30,
    "city": "Paradise Falls",
    "cgpa": 10,
    "degree": "M.Pharm",
    "profession": "Architect",
    "profession_hour_daily": 24,
    "profession_pressure": 0,
    "profession_satisfaction": 5,
    "financial_stress": 0,
    "sleep_duration": "Less than 5 hours",
    "dietary_habits": "Healthy",
    "history_family_illness_mental": true,
    "history_thoughts_suicidal": true }

const dict_prediction = {
    "date": "2026/08/25",
    "gender": "Female",
    "age": 40,
    "city": "Vault 777",
    "cgpa": 10,
    "degree": "M.Pharm",
    "profession": "Architect",
    "profession_hour_daily": 24,
    "profession_pressure": 5,
    "profession_satisfaction": 5,
    "financial_stress": 5,
    "sleep_duration": "Less than 5 hours",
    "dietary_habits": "Healthy",
    "history_family_illness_mental": true,
    "history_thoughts_suicidal": true,
    "depression": true,
    "confidence": 0.777 }



function App() {
    // Predictor
    const [predictorInput, setPredictorInput] = useState({});
    const [predictorResult, setPredictorResult] = useState({});
    // Database
    const [entryToCreate, setEntryToCreate] = useState({});
    const [entryCreated, setEntryCreated] = useState({});
    const [entryRead, setEntryRead] = useState({});
    const [entryRead_Id, setEntryRead_Id] = useState(0);



    // useEffect(
    //     () => { readPrediction(); },
    //     []
    // );



    const apiAiPredictorPost = async (data_to_predict: any) => {
        const ai_api_post_predictor: string = `${import.meta.env.VITE_AI_HOST}:${import.meta.env.VITE_AI_PORT}${import.meta.env.VITE_AI_API_POST_PREDICT}`;
        
        
        // TEMP
        // data = dict_sample
        // TEMP

        try {
            const response = await fetch(
                ai_api_post_predictor,
                {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(data_to_predict)
                }
            )
            
            if (!response.ok) {
                throw new Error(`Response status: ${response.status}`);
            }

            const result = await response.json();

            setPredictorResult(result);

            return result;
        }
        catch (error) {
            console.error(error.message);
        }
    };



    const createEntry = async (entry_new: any) => {
        // TEMP
        // data = dict_prediction
        // TEMP

        const result = await axios.post(
            URL_API_DB_PREDICTION,
            entry_new );

        setEntryCreated(result.data);
        setEntryToCreate({});

        return result.data;
    };



    const readEntry = async (entry_id: number) => {
        const result = await axios.get(`${URL_API_DB_PREDICTION}/${entry_id}`);

        setEntryRead(result.data);

        return result.data;
    };



    const apiAiPredictorPost_AND_createEntry = async (data_to_predict: any) => {
        const prediction_full = await apiAiPredictorPost(data_to_predict);

        let prediction = {
            "date": new Date().toISOString(),
            "depression": prediction_full?.prediction,
            "confidence": (prediction_full?.prediction == false) ?
                prediction_full?.prediction_confidence[0] * 100 :
                prediction_full?.prediction_confidence[1] * 100
        };

        // console.log(prediction);

        let entry_new = Object.assign(
            {},
            data_to_predict,
            prediction );

        // console.log(data_to_insert);

        await createEntry(entry_new);
    };



    // const updatePrediction = async (id, ()) => {
    //     const result = await axios.put(
    //         `${API_URL}/${id}`,
    //         { name: newName } );
    //     setPredictions(predictions.map(item => (item.id === id ? result.data : item)));
    // };



    // const deletePrediction = async (id) => {
    //     await axios.delete(`${URL_API_DB_PREDICTION}/${id}`);
    //     setPredictions(predictions.filter(item => item.id !== id));
    // };



    return (
        <div className="App">
            <h1>CRUD App with React and PostgreSQL</h1>

            <h2>Insert an entry into the database</h2>
            <input
                type="text"
                value={JSON.stringify(entryToCreate)}
                onChange={(e) => setEntryToCreate(JSON.parse(e.target.value))}
            />
            <button onClick={() => createEntry(entryToCreate)}>Insert entry</button>
            
            <h3>Entry inserted</h3>
            <p>{JSON.stringify(entryCreated)}</p>



            <h2>Get an entry from the database</h2>
            <input
                type="text"
                value={entryRead_Id}
                onChange={(e) => setEntryRead_Id(Number(e.target.value))}
            />
            <button onClick={() => readEntry(entryRead_Id)}>Get entry</button>
            
            <h3>Entry found</h3>
            <p>{JSON.stringify(entryRead)}</p>



            <h2>Send data to the predictor and get its prediction</h2>
            <input
                type="text"
                value={JSON.stringify(predictorInput)}
                onChange={(e) => setPredictorInput(JSON.parse(e.target.value))}
            />
            <button onClick={() => apiAiPredictorPost_AND_createEntry(predictorInput)}>Read Prediction</button>
            
            <h3>Prediction made</h3>
            <p>{JSON.stringify(predictorResult)}</p>

            {/* <ul>
                {items.map(item => (
                    <li key={item.id}>
                        <input
                            type="text"
                            value={item.name}
                            onChange={(e) => updateItem(item.id, e.target.value)}
                        />
                        <button onClick={() => deleteItem(item.id)}>Delete</button>
                    </li>
                ))}
            </ul> */}
        </div>
    );
}

export default App;
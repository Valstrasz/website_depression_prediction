import { useEffect, useState } from "react";
import axios from "axios";



const URL_API_DB_PREDICTION = "http://localhost:5000/db_prediction";

const dict_predictorInput = {
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

const dict_databaseEntry = {
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
    const [entryPredictorCreated, setEntryPredictorCreated] = useState({});
    const [entryManuallyCreated, setEntryManuallyCreated] = useState({});
    const [entryRead, setEntryRead] = useState({});
    const [entryRead_Id, setEntryRead_Id] = useState(0);



    // useEffect(
    //     () => { readPrediction(); },
    //     []
    // );



    const apiAiPredictorPost = async (data_to_predict: any) => {
        const ai_api_post_predictor: string = `${import.meta.env.VITE_AI_HOST}:${import.meta.env.VITE_AI_PORT}${import.meta.env.VITE_AI_API_POST_PREDICT}`;
        
        
        // TEMP
        // data = dict_predictorInput
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



    const createEntry = async (entry_new: any, callback_setEntryCreated: any) => {
        // TEMP
        // data = dict_databaseEntry
        // TEMP

        const result = await axios.post(
            URL_API_DB_PREDICTION,
            entry_new );

        callback_setEntryCreated(result.data);
        // setEntryToCreate({});

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

        await createEntry(entry_new, setEntryPredictorCreated);
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
        <div className="APP">
            <div className="header">
                <h1 className="app_title">
                    Depression diagnostic assistant platform
                </h1>
                <h1 className="app_title app_title_sub">
                    (Proof of Concept)
                </h1>
            </div>



            <div className="group_unit_function">
                {/* GET PREDICTION */}
                <div className="unit_function">
                    <h2 className="centered">
                        Send data to the predictor and get its prediction
                    </h2>
                    {/* <input
                        type="text"
                        value={JSON.stringify(predictorInput)}
                        onChange={(e) => setPredictorInput(JSON.parse(e.target.value))}
                    /> */}
                    <textarea className="input_predictor focus_input"
                        defaultValue={JSON.stringify(dict_predictorInput, null, "  ")}
                        onChange={(e) => setPredictorInput(JSON.parse(e.target.value))}
                    />
                    <button className="hover_button" onClick={() => apiAiPredictorPost_AND_createEntry(predictorInput)}>
                        Get prediction
                    </button>
                    
                    <h3 className="centered">
                        Prediction made
                    </h3>
                    <pre className="display_json output_predictor">
                        {JSON.stringify(predictorResult, null, "  ")}
                    </pre>
                    
                    <h3 className="centered">
                        Entry inserted in the database
                    </h3>
                    <pre className="display_json entry_database">
                        {JSON.stringify(entryPredictorCreated, null, "  ")}
                    </pre>
                </div>



                {/* INSERT ENTRY */}
                <div className="unit_function">
                    <h2 className="centered">
                        Insert an entry into the database
                    </h2>
                    {/* <input
                        type="text"
                        value={JSON.stringify(entryToCreate)}
                        onChange={(e) => setEntryToCreate(JSON.parse(e.target.value))}
                    /> */}
                    <textarea className="entry_database focus_input"
                        defaultValue={JSON.stringify(dict_databaseEntry, null, "  ")}
                        onChange={(e) => setEntryToCreate(JSON.parse(e.target.value))}
                    />
                    <button className="hover_button" onClick={() => createEntry(entryToCreate, setEntryManuallyCreated)}>
                        Insert entry
                    </button>
                    
                    <h3 className="centered">
                        Entry inserted into the database
                        </h3>
                    <pre className="display_json entry_database">
                        {JSON.stringify(entryManuallyCreated, null, "  ")}
                    </pre>
                </div>



                {/* GET ENTRY */}
                <div className="unit_function">
                    <h2 className="centered">
                        Get an entry from the database
                    </h2>
                    <input className="input_id focus_input"
                        type="text"
                        defaultValue="0"
                        onChange={(e) => setEntryRead_Id(Number(e.target.value))}
                    />
                    <button className="hover_button" onClick={() => readEntry(entryRead_Id)}>
                        Get entry
                    </button>
                    
                    <h3 className="centered">
                        Entry found in the database
                    </h3>
                    <pre className="display_json entry_database">
                        {JSON.stringify(entryRead, null, "  ")}
                    </pre>
                </div>
            </div>
        </div>
    );
}

export default App;
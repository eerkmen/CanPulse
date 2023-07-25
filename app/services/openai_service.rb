class OpenaiService
  def self.send_diagnosis(patient_diagnosis, medications)
    diagnosis = Diagnosis.find(patient_diagnosis.diagnosis_id)
    complaint = patient_diagnosis.complaint
    today = Date.today

    medications_info = if medications.empty?
      "none"
    else
      medications.map { |med| "#{med.brand_name} - #{med.dosage}" }.join(", ")
    end

    conversation = [
      {role: "user", content: "Today is #{today}, patient has #{diagnosis.name} with complaints of #{complaint}. Medication: #{medications_info}. Provide an appointment date to the patient. Format:'yyyy-mm-dd'. Least words as possible."}
    ]
    client = OpenAI::Client.new
    result = client.chat(
      parameters:{
        model: "gpt-3.5-turbo",
        messages: conversation,
        temperature: 0.5,
      }
    )

    result
  end
end

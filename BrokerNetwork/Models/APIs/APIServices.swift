import Foundation

class APIService{

    static func callAPI(completion: @escaping(APIResponse<Data>)->Void){
        let url = URL(string: "https://run.mocky.io/v3/c52cf4ce-a639-42d7-a606-2c0a8b848536")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard data != nil else{
                completion(.failure(error: CustomErrors.DataInResponseIsNil))
                return }
            guard error == nil else{
                completion(.failure(error: error!))
                return }
            guard let httpResponse = response as? HTTPURLResponse else{ return }
            guard httpResponse.statusCode == 200 else{
                completion(.failure(error: CustomErrors.ErrorCode(code: httpResponse.statusCode)))
                return }
            completion(.success(value: data!))
            
        }.resume()
    }
    
}



// Code generated by smithy-swift-codegen. DO NOT EDIT!

@_spi(FileBasedConfig) import AWSClientRuntime
import ClientRuntime
import Foundation
import Logging

public class SupplyChainClient {
    public static let clientName = "SupplyChainClient"
    let client: ClientRuntime.SdkHttpClient
    let config: SupplyChainClient.SupplyChainClientConfiguration
    let serviceName = "SupplyChain"
    let encoder: ClientRuntime.RequestEncoder
    let decoder: ClientRuntime.ResponseDecoder

    public init(config: SupplyChainClient.SupplyChainClientConfiguration) {
        client = ClientRuntime.SdkHttpClient(engine: config.httpClientEngine, config: config.httpClientConfiguration)
        let encoder = ClientRuntime.JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
        self.encoder = config.encoder ?? encoder
        let decoder = ClientRuntime.JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Infinity", negativeInfinity: "-Infinity", nan: "NaN")
        self.decoder = config.decoder ?? decoder
        self.config = config
    }

    public convenience init(region: Swift.String) throws {
        let config = try SupplyChainClient.SupplyChainClientConfiguration(region: region)
        self.init(config: config)
    }

    public convenience init() async throws {
        let config = try await SupplyChainClient.SupplyChainClientConfiguration()
        self.init(config: config)
    }
}

extension SupplyChainClient {
    public typealias SupplyChainClientConfiguration = AWSClientConfiguration<ServiceSpecificConfiguration>

    public struct ServiceSpecificConfiguration: AWSServiceSpecificConfiguration {
        public typealias AWSServiceEndpointResolver = EndpointResolver

        public var serviceName: String { "SupplyChain" }
        public var clientName: String { "SupplyChainClient" }
        public var endpointResolver: EndpointResolver

        public init(endpointResolver: EndpointResolver? = nil) throws {
            self.endpointResolver = try endpointResolver ?? DefaultEndpointResolver()
        }
    }
}

public struct SupplyChainClientLogHandlerFactory: ClientRuntime.SDKLogHandlerFactory {
    public var label = "SupplyChainClient"
    let logLevel: ClientRuntime.SDKLogLevel
    public func construct(label: String) -> LogHandler {
        var handler = StreamLogHandler.standardOutput(label: label)
        handler.logLevel = logLevel.toLoggerType()
        return handler
    }
    public init(logLevel: ClientRuntime.SDKLogLevel) {
        self.logLevel = logLevel
    }
}

extension SupplyChainClient: SupplyChainClientProtocol {
    /// Performs the `CreateBillOfMaterialsImportJob` operation on the `GalaxyPublicAPIGateway` service.
    ///
    /// CreateBillOfMaterialsImportJob creates an import job for the Product Bill Of Materials (BOM) entity. For information on the product_bom entity, see the AWS Supply Chain User Guide. The CSV file must be located in an Amazon S3 location accessible to AWS Supply Chain. It is recommended to use the same Amazon S3 bucket created during your AWS Supply Chain instance creation.
    ///
    /// - Parameter CreateBillOfMaterialsImportJobInput : The request parameters for CreateBillOfMaterialsImportJob.
    ///
    /// - Returns: `CreateBillOfMaterialsImportJobOutput` : The response parameters of CreateBillOfMaterialsImportJob.
    ///
    /// - Throws: One of the exceptions listed below __Possible Exceptions__.
    ///
    /// __Possible Exceptions:__
    /// - `AccessDeniedException` : You do not have the required privileges to perform this action.
    /// - `ConflictException` : Updating or deleting a resource can cause an inconsistent state.
    /// - `InternalServerException` : Unexpected error during processing of request.
    /// - `ResourceNotFoundException` : Request references a resource which does not exist.
    /// - `ServiceQuotaExceededException` : Request would cause a service quota to be exceeded.
    /// - `ThrottlingException` : Request was denied due to request throttling.
    /// - `ValidationException` : The input does not satisfy the constraints specified by an AWS service.
    public func createBillOfMaterialsImportJob(input: CreateBillOfMaterialsImportJobInput) async throws -> CreateBillOfMaterialsImportJobOutput
    {
        let context = ClientRuntime.HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .withDecoder(value: decoder)
                      .withMethod(value: .post)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "createBillOfMaterialsImportJob")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withCredentialsProvider(value: config.credentialsProvider)
                      .withRegion(value: config.region)
                      .withSigningName(value: "scn")
                      .withSigningRegion(value: config.signingRegion)
                      .build()
        var operation = ClientRuntime.OperationStack<CreateBillOfMaterialsImportJobInput, CreateBillOfMaterialsImportJobOutput>(id: "createBillOfMaterialsImportJob")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.IdempotencyTokenMiddleware<CreateBillOfMaterialsImportJobInput, CreateBillOfMaterialsImportJobOutput>(keyPath: \.clientToken))
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<CreateBillOfMaterialsImportJobInput, CreateBillOfMaterialsImportJobOutput>())
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<CreateBillOfMaterialsImportJobInput, CreateBillOfMaterialsImportJobOutput>())
        let endpointParams = EndpointParams(endpoint: config.endpoint, region: config.region, useDualStack: config.useDualStack ?? false, useFIPS: config.useFIPS ?? false)
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<CreateBillOfMaterialsImportJobOutput>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0", config: config)))
        operation.serializeStep.intercept(position: .after, middleware: ContentTypeMiddleware<CreateBillOfMaterialsImportJobInput, CreateBillOfMaterialsImportJobOutput>(contentType: "application/json"))
        operation.serializeStep.intercept(position: .after, middleware: ClientRuntime.BodyMiddleware<CreateBillOfMaterialsImportJobInput, CreateBillOfMaterialsImportJobOutput, ClientRuntime.JSONWriter>(documentWritingClosure: ClientRuntime.JSONReadWrite.documentWritingClosure(encoder: encoder), inputWritingClosure: JSONReadWrite.writingClosure()))
        operation.finalizeStep.intercept(position: .before, middleware: ClientRuntime.ContentLengthMiddleware())
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, CreateBillOfMaterialsImportJobOutput>(options: config.retryStrategyOptions))
        let sigv4Config = AWSClientRuntime.SigV4Config(unsignedBody: false, signingAlgorithm: .sigv4)
        operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<CreateBillOfMaterialsImportJobOutput>(config: sigv4Config))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<CreateBillOfMaterialsImportJobOutput>(responseClosure(decoder: decoder), responseErrorClosure(CreateBillOfMaterialsImportJobOutputError.self, decoder: decoder)))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<CreateBillOfMaterialsImportJobOutput>(clientLogMode: config.clientLogMode))
        let result = try await operation.handleMiddleware(context: context, input: input, next: client.getHandler())
        return result
    }

    /// Performs the `GetBillOfMaterialsImportJob` operation on the `GalaxyPublicAPIGateway` service.
    ///
    /// Get status and details of a BillOfMaterialsImportJob.
    ///
    /// - Parameter GetBillOfMaterialsImportJobInput : The request parameters for GetBillOfMaterialsImportJob.
    ///
    /// - Returns: `GetBillOfMaterialsImportJobOutput` : The response parameters for GetBillOfMaterialsImportJob.
    ///
    /// - Throws: One of the exceptions listed below __Possible Exceptions__.
    ///
    /// __Possible Exceptions:__
    /// - `AccessDeniedException` : You do not have the required privileges to perform this action.
    /// - `ConflictException` : Updating or deleting a resource can cause an inconsistent state.
    /// - `InternalServerException` : Unexpected error during processing of request.
    /// - `ResourceNotFoundException` : Request references a resource which does not exist.
    /// - `ServiceQuotaExceededException` : Request would cause a service quota to be exceeded.
    /// - `ThrottlingException` : Request was denied due to request throttling.
    /// - `ValidationException` : The input does not satisfy the constraints specified by an AWS service.
    public func getBillOfMaterialsImportJob(input: GetBillOfMaterialsImportJobInput) async throws -> GetBillOfMaterialsImportJobOutput
    {
        let context = ClientRuntime.HttpContextBuilder()
                      .withEncoder(value: encoder)
                      .withDecoder(value: decoder)
                      .withMethod(value: .get)
                      .withServiceName(value: serviceName)
                      .withOperation(value: "getBillOfMaterialsImportJob")
                      .withIdempotencyTokenGenerator(value: config.idempotencyTokenGenerator)
                      .withLogger(value: config.logger)
                      .withPartitionID(value: config.partitionID)
                      .withCredentialsProvider(value: config.credentialsProvider)
                      .withRegion(value: config.region)
                      .withSigningName(value: "scn")
                      .withSigningRegion(value: config.signingRegion)
                      .build()
        var operation = ClientRuntime.OperationStack<GetBillOfMaterialsImportJobInput, GetBillOfMaterialsImportJobOutput>(id: "getBillOfMaterialsImportJob")
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLPathMiddleware<GetBillOfMaterialsImportJobInput, GetBillOfMaterialsImportJobOutput>())
        operation.initializeStep.intercept(position: .after, middleware: ClientRuntime.URLHostMiddleware<GetBillOfMaterialsImportJobInput, GetBillOfMaterialsImportJobOutput>())
        let endpointParams = EndpointParams(endpoint: config.endpoint, region: config.region, useDualStack: config.useDualStack ?? false, useFIPS: config.useFIPS ?? false)
        operation.buildStep.intercept(position: .before, middleware: EndpointResolverMiddleware<GetBillOfMaterialsImportJobOutput>(endpointResolver: config.serviceSpecific.endpointResolver, endpointParams: endpointParams))
        operation.buildStep.intercept(position: .before, middleware: AWSClientRuntime.UserAgentMiddleware(metadata: AWSClientRuntime.AWSUserAgentMetadata.fromConfig(serviceID: serviceName, version: "1.0", config: config)))
        operation.finalizeStep.intercept(position: .after, middleware: ClientRuntime.RetryMiddleware<ClientRuntime.DefaultRetryStrategy, AWSClientRuntime.AWSRetryErrorInfoProvider, GetBillOfMaterialsImportJobOutput>(options: config.retryStrategyOptions))
        let sigv4Config = AWSClientRuntime.SigV4Config(unsignedBody: false, signingAlgorithm: .sigv4)
        operation.finalizeStep.intercept(position: .before, middleware: AWSClientRuntime.SigV4Middleware<GetBillOfMaterialsImportJobOutput>(config: sigv4Config))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.DeserializeMiddleware<GetBillOfMaterialsImportJobOutput>(responseClosure(decoder: decoder), responseErrorClosure(GetBillOfMaterialsImportJobOutputError.self, decoder: decoder)))
        operation.deserializeStep.intercept(position: .after, middleware: ClientRuntime.LoggerMiddleware<GetBillOfMaterialsImportJobOutput>(clientLogMode: config.clientLogMode))
        let result = try await operation.handleMiddleware(context: context, input: input, next: client.getHandler())
        return result
    }

}
